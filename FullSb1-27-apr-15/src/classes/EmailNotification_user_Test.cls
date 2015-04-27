/*
Author    :- Premanath Reddy
Date      :- 3/14/2013
Usage     :- Test class for EmailNotification_user Trigger
*/
@isTest
private class EmailNotification_user_Test{
    static testmethod void methodname(){
        test.startTest();
        String p = RecordTypeHelper.getprofileid('System Administrator');
        String p1 = RecordTypeHelper.getprofileid('Sitecore SysAdmin');
        
        List<UserRole> urlst=new List<UserRole>();
        UserRole ur = new UserRole(Name= 'System Administrator');
        urlst.add(ur);
        
        UserRole ur1 = new UserRole(Name= 'Sitecore SysAdmin');
        urlst.add(ur1);
        
        insert urlst;

        User u = new User(alias = 'standt', email='standarduser9812@testorg.com', 
        lastname='Testing', EmailEncodingKey='UTF-8',IsActive=true,
        languagelocalekey='en_US', 
        localesidkey='en_US', profileid = p,TimeZoneSidKey='America/Los_Angeles',
        username='standarduser9812@testorg.com',
        userroleid=ur.id);
        insert u;
        
        u.userroleid=ur1.id;
        u.profileid=p1;
        update u;
        
        u.IsActive=false;
        update u;
        Test.stopTest();
    }
}