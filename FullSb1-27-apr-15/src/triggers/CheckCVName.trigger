trigger CheckCVName on Attachment (after insert) {
    CvRenaming.renameCV(trigger.new);
}