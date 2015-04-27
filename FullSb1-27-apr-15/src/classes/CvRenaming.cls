/**
 * Feature #1439
 * @description: Cv Renaming
 * @author: PhanithChhun
 * @createdDate: Aug-28-2014
 */
public class CvRenaming {
	
	public final static String USER_PRO_HULT_CAREER_POINT = 'Hult Career Point Student Profile';
	public final static String USER_PRO_HULT_CAREER_POINT_OFF_SERVICE = 'Hult Career Point Student Profile - Off Service';
	
	private static Boolean requireCheck(){
		if(Test.isRunningTest()) return true;
		Profile p = [Select Name From Profile Where Id =: UserInfo.getProfileId()];
		return p.Name == USER_PRO_HULT_CAREER_POINT || p.Name == USER_PRO_HULT_CAREER_POINT_OFF_SERVICE;
	}
	
	private static Boolean compareAttachments(Attachment attA, Attachment attB){
		return	attA.CreatedById == attB.CreatedById &&
				attA.Description == attB.Description &&
				attA.BodyLength == attB.BodyLength &&
				attA.ContentType == attB.ContentType &&
				Math.abs(attA.CreatedDate.getTime() - attB.CreatedDate.getTime()) <= 60000; //should be within 60 seconds
	}
	
	/** 
	 * This method is called from Attachment trigger CheckCVName (after insert)
	 * Note: The attachment to Contact is always attached before the attachment to Application
	 */
	public static void renameCV(List<Attachment> atts){
		if(!requireCheck()) return;
		//All attachements related to App
		Map<Id, List<Attachment>> parIds = new Map<Id, List<Attachment>>();
		for(Attachment att : atts){
			String objectAPIName = att.ParentId.getSObjectType().getDescribe().getName();
			if(objectAPIName != 'ts2__Application__c') continue; 
			if(!parIds.containsKey(att.ParentId)) parIds.put(att.ParentId, new List<Attachment>());
			parIds.get(att.ParentId).add(att);
		}
		//Mapping App parent to Contact
		Map<Id, Id> mAppContact = new Map<Id, Id>();
		for(ts2__Application__c app : [Select ts2__Candidate_Contact__c From ts2__Application__c Where Id IN: parIds.keySet()]){
			mAppContact.put(app.Id, app.ts2__Candidate_Contact__c);
		}
		//All attachments related to Contact
		Map<Id, List<Attachment>> existingConAtt = new Map<Id, List<Attachment>>();
		for(Attachment att : [Select Id, ParentId, Name, CreatedById, Description, BodyLength, ContentType, CreatedDate From Attachment Where ParentId IN: mAppContact.values()]){
			if(!existingConAtt.containsKey(att.ParentId)) existingConAtt.put(att.ParentId, new List<Attachment>());
			existingConAtt.get(att.ParentId).add(att);
		}
		
		List<Attachment> attToUpdateName = new List<Attachment>();
		for(Id appId : parIds.keySet()){
			Id conId = mAppContact.get(appId);
			List<Attachment> appAtts = parIds.get(appId);
			List<Attachment> conAtts = existingConAtt.get(conId);
			for(Attachment appAtt : appAtts){
				for(Attachment conAtt : conAtts){
					if(compareAttachments(appAtt, conAtt)){
						conAtt.Name = appAtt.Name;
						attToUpdateName.add(conAtt);
					}
				}
			}
		}
		if(!attToUpdateName.isEmpty()) update attToUpdateName;
	}
	
}