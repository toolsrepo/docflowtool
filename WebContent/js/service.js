var service = function(){

	function addUser(data){
		return request('POST','/api/users/add',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()},data);
	}
	
	this.login = login;
	function login(data, responseFunction){
		return request('POST','rest/UserService/login',{'x-docwrkflow-auth' :  undefined},data, null, responseFunction);
	}
	
	function logout(){
		return request('POST','rest/UserService/logout',{'x-docwrkflow-auth' :  getDocWorkflowAuthorizationId()});
	}
	
	function setting(data){
		return request('POST','/api/users/setting',{'x-docwrkflow-auth' :  getDocWorkflowAuthorizationId()},data);
	}
	
	function getApproval(){
	    return request('GET','/api/users/getApproval',{'x-docwrkflow-auth' :  getDocWorkflowAuthorizationId()});
	}
	  
	function getAllDoc(){
		return request('GET','rest/WflService/docs',{'x-docwrkflow-auth' :  getDocWorkflowAuthorizationId()});
	}
	  
	function getDocByUser(data){
		return request('GET','rest/WflService/docs',{'x-docwrkflow-auth' :  getDocWorkflowAuthorizationId()},null,{'userId':data});
	}
	  
	function getDocDetails(data){
		return request('GET','rest/WflService/getdetail',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()},null,{'docId':data});
	}
 
	function assignToMe(data){
		return request('POST', 'rest/WflService/assigndocto', {'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()}, data);
	}
	
	function submitWorkflow(data){
		return request('POST', 'rest/WflService/submitwf', {'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()}, data);
	}
	
	function retrieveTags(data){
		 return request('GET','rest/docadmin/doctypetags',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()},null,{'docTypeId':data});
	}
	
	function retrieveSubTags(data){
		 return request('GET','rest/docadmin/doctagsubtags',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()},null,{'docTagId':data});
	}
	
	function retrieveTypeTagSubTagsMap(data){
		 return request('GET','rest/docadmin/doctypetagsubtags',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()},null,{'docTypeId':data});
	}

	function retrieveAllDocTypes() {
		 return request('GET','rest/docadmin/doctype',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()});
	}
	
	function retrieveAllDocTags() {
		 return request('GET','rest/docadmin/doctags',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()});
	}
	
	function retrieveAllDocSubTags() {
		 return request('GET','rest/docadmin/docsubtags',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()});
	}
	
	function retrieveAllDocRepos() {
		 return request('GET','rest/docadmin/docrepo',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()});
	}
	
	function retrieveAllUnmappedTypeTags(data) {
		 return request('GET','rest/docadmin/docunmappedtypetags',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()},null,{'docTypeId':data});
	}

	function retrieveAllUnmappedTagsSubTags(data) {
		 return request('GET','rest/docadmin/docunmappedtagsubtags',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()},null,{'docTagId':data});
	}
	
	function retrieveAllUsers() {
		 return request('GET','rest/useradmin/users',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()});
	}
	
	function retrieveAllRoles() {
		 return request('GET','rest/useradmin/roles',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()});
	}
	
	function retrieveUserDetais(data) {
		 return request('GET','rest/useradmin/userdetail',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()},null,{'userId':data});
	}

	function retrieveRoleUserMap(data) {
		 return request('GET','rest/useradmin/roleusermap',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()},null,{'roleId':data});
	}

	function retrieveUnmappedRoleUser(data) {
		 return request('GET','rest/useradmin/unmappedroleuser',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()},null,{'roleId':data});
	}

	function uploadDocument(data) {
		 return request('GET','rest/docadmin/uploaddoc',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()}, null, {});
	}
	
	function downloadDocTemplate() {
		 return request('GET','rest/docadmin/template',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()});
	}
	
	function setDocWorkflowAuthorizationId(userData) {
		/*$rootScope.selectedUserRole.userId = userData.userId;
		$rootScope.selectedUserRole.userName = userData.userName;
		$rootScope.selectedUserRole.selectedRoleId = userData.roleId;		
		$rootScope.selectedUserRole.selectedRoleName = userData.userRoleList[0].roleName;		*/
	}
	
	function getDocWorkflowAuthorizationId() {
		return $rootScope.selectedUserRole.userId+"|"+$rootScope.selectedUserRole.selectedRoleId;
	}
	
	function fetchCompletionReportData() {
		 return request('GET','rest/report/completion',{'x-docwrkflow-auth' : getDocWorkflowAuthorizationId()});
	}	

  	function request(method,url,headers,data,params, responseFunction){
		ajaxData = JSON.stringify(data);
		var ajaxRequestObject = {
				"url" : cotextPathTop+"/"+url,
				"headers" : headers,
				"title" : "Ajax Query",
				"responseFunction" : responseFunction,
				"postBody" : ajaxData,
				"method" : method,
				"contentType" : "application/json"
			};
			
		return new commonframework().request(ajaxRequestObject);
  	}
}