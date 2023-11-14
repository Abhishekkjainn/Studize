const sharedPrefKeySubjectJsonList = 'subjects_json_list';

// We use a seperate list for storing names of subjects because trying to get
// number of subjects from sharedPrefKeySubjectJsonList is an expensive
// operation, where we need to parse Json which contains ALL tasks
const sharedPrefKeySubjectsNameList = 'subjects_name_list';
