<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
<c:when test="${not empty myDocumentList}">
<div id="tablewrapper">
	<div id="tableheader">
		<div class="search">
			<select id="columns" onchange="sorter.search('query')"></select>
			<input type="text" id="query" onkeyup="sorter.search('query')" />
		</div>
		<span class="details">
			<div class="btn-group">
				<button class="btn btn-default view-comment" id="checkerUnasgn" onclick="#" style="display:none">
					<i class="fa fa-play"></i>
					<b>Unassign</b>
				</button>&nbsp;&nbsp;&nbsp;					
				<button  class="button-secondary pure-button" id="checkerStart" onclick="landingObj.startClick()" disabled>
					<b>Start</b>
				</button >&nbsp;&nbsp;&nbsp;		
				<button  class="button-warning pure-button" id="checkerHold" onclick="landingObj.holdClick()" disabled>
					<b>Hold</b> 
				</button >&nbsp;&nbsp;&nbsp;
				<button  class="button-success pure-button" id="checkerComplete" onclick="landingObj.completeClick()" disabled>
					<b>Complete</b>
				</button >&nbsp;&nbsp;&nbsp;				
			</div>				
			<div><input type="image" src="../../images/icon_refresh.jpg" style="width:30px;height:30px;" onclick="landingObj.reloadGridData()" /></div>
			<div>Records <span id="startrecord"></span>-<span id="endrecord"></span> of <span id="totalrecords"></span></div>
			<div><a href="javascript:sorter.reset()">reset</a></div>
		</span>
	</div>
	<table cellpadding="0" cellspacing="0" border="0" id="mytable" class="tinytable">
		<thead>
			<tr>	
				<th><h3 style="Color:#ffffff">Select</h3></th>
				<th width="15%"><h3 style="Color:#ffffff">Agreement Id</h3></th>
				<th width="4%"><h3 style="Color:#ffffff">LOB</h3></th>
				<th width="15%"><h3 style="Color:#ffffff">Agreement Type</h3></th>
				<th width="15%"><h3 style="Color:#ffffff">Maker Status</h3></th>
				<th width="18%"><h3 style="Color:#ffffff">Maker Details</h3></th>
				<th width="15%"><h3 style="Color:#ffffff">Current Status</h3></th>
				<th width="18%"><h3 style="Color:#ffffff">QC Details</h3></th>
				<th width="30%"><h3 style="Color:#ffffff">Error Reason</h3></th>		
				<th><h3 style="Color:#ffffff">Number of Pages</h3></th>
				<th><h3 style="Color:#ffffff">Number of Fields</h3></th>
				<th style="display:none"><h3 style="Color:#ffffff">StatusCode</h3></th>	
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${myDocumentList}" var="document">
				<tr>
				  <td><input type="checkbox" id="<c:out value="${document.agreementId}" />" name="docId" value="<c:out value="${document.agreementId}" />" onclick="landingObj.setMyAssignment(this)" /> </td>
				  <td width="15%" id="<c:out value="${document.agreementId}agreementId" />"><c:out value="${document.agreementId}" /></td>
				  <td width="4%" id="<c:out value="${document.agreementId}lob" />"><c:out value="${document.lob}" /></td>
				  <td width="15%" id="<c:out value="${document.agreementId}agreementTypeDesc" />"><c:out value="${document.agreementTypeDesc}" /></td>
				  <td width="15%" id="<c:out value="${document.agreementId}makerStatus" />"><c:out value="${document.makerStatus}" /></td>
				  <td width="18%" id="<c:out value="${document.agreementId}makerComments" />"><c:out value="${document.makerComments}" /></td>
				  <td width="15%" id="<c:out value="${document.agreementId}statusDescription" />"><c:out value="${document.statusDescription}" /></td>
				  <td width="18%" id="<c:out value="${document.agreementId}checkerComments" />"><c:out value="${document.checkerComments}" /></td>
				  <td width="30%" id="<c:out value="${document.agreementId}errorReason" />"><c:out value="${document.errorReason}" /></td>		  
				  <td id="<c:out value="${document.agreementId}numPages" />"><c:out value="${document.numPages}" /></td>		  
				  <td id="<c:out value="${document.agreementId}numFields" />"><c:out value="${document.numFields}" /></td>		  
				  <td style="display:none" id="<c:out value="${document.agreementId}statusCode" />" value="<c:out value="${document.statusCode}" />" ><c:out value="${document.statusCode}" /></td>		  
				</tr>
			</c:forEach>
	    </tbody>
	</table>

	<div id="tablefooter">
        <div id="tablenav">
			<div>
				<img src="<%=request.getContextPath()%>/static/TinyTableV3/images/first.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1,true)" />
				<img src="<%=request.getContextPath()%>/static/TinyTableV3/images/previous.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1)" />
				<img src="<%=request.getContextPath()%>/static/TinyTableV3/images/next.gif" width="16" height="16" alt="First Page" onclick="sorter.move(1)" />
				<img src="<%=request.getContextPath()%>/static/TinyTableV3/images/last.gif" width="16" height="16" alt="Last Page" onclick="sorter.move(1,true)" />
			</div>
			<div>
				<select id="pagedropdown"></select>
			</div>
			<div>
				<a href="javascript:sorter.showall()">view all</a>
			</div>
        </div>
		<div id="tablelocation">
			<div>
				<select onchange="sorter.size(this.value)">
				<option value="5">5</option>
					<option value="10" selected="selected">10</option>
					<option value="20">20</option>
					<option value="50">50</option>
					<option value="100">100</option>
				</select>
				<span>Entries Per Page</span>
			</div>
			<div class="page">Page <span id="currentpage"></span> of <span id="totalpages"></span></div>
		</div>
    </div>
    
	<br>
	<!--<div id="checkerActionsPanel" style="display:block">
		<table>
			<tr>
				<td>Status:</td>
				<td>
					<select id="checkerStatus" disabled onchange="landingObj.setHoldStatus(this)" >
						<c:forEach items="${workflowStatusList}" var="status">
							<option value="${status.statusCode}">${status.statusDescription}</option>
						</c:forEach>
					</select>
				</td>
				<td>Comments:</td>
				<td><input type="textarea" id="checkerComments" value="" disabled /></td>
				<td>Error Reason:</td>
				<td>
					<select id="errorReasonList" disabled >
						<c:forEach items="${errorList}" var="error">
							<option value="${error.errorTypeId}">${error.errorTypeName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
	</div>-->
	<div id="checkerActionPanel" style="display:block">
		<table align="left" width="100%">
			<tr>
				<table>
					<tr>
						<td>
							<fieldset>
								<legend>
									<Font color="Blue"><b>Comments Section:</b></Font>
								</legend>
								<b>Status:</b>
								<select id="checkerStatus" onchange="landingObj.setHoldStatus(this)" disabled >
								<c:forEach items="${workflowStatusList}" var="status">
									<option value="${status.statusCode}">${status.statusDescription}</option>
								</c:forEach>
								</select>
								&nbsp;
								<b>Comments:</b>
								<textarea id="checkerComments" valign="middle" class="pure-input-4-3" disabled rows="2" cols="60"></textarea>
								&nbsp;
								<BR>
								<b>Error Reason:</b>
								<select id="errorReasonList" disabled >
									<c:forEach items="${errorList}" var="error">
										<option value="${error.errorTypeId}">${error.errorTypeName}</option>
									</c:forEach>
								</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
								<b>Number of Pages:</b>
								<input type="text" id="numPages">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<b>Number of Fields:</b>
								<input type="text" id="numFields">
							</fieldset>
						</td>
					</tr>
				</table>
			</tr>
		</table>
	</div>
	<br>
	<!--<div class="btn-group btn-group-justified">
		<div class="btn-group">
			<button class="btn btn-default view-comment" id="checkerUnasgn" onclick="#" style="display:none">
				<i class="fa fa-play"></i>
				Unassign
			</button>&nbsp;&nbsp;&nbsp;
			<button class="btn btn-default view-comment" id="checkerStart" onclick="landingObj.startClick()" disabled>
				<i class="fa fa-play"></i>
				Start &nbsp;&nbsp;&nbsp;
			</button>&nbsp;&nbsp;&nbsp;		
			<button class="btn btn-default view-comment" id="checkerHold" onclick="landingObj.holdClick()" disabled>
				<i class="fa fa-stop""></i>
				Hold &nbsp;&nbsp;&nbsp;
			</button>&nbsp;&nbsp;&nbsp;
			<button class="btn btn-default view-comment" id="checkerComplete" onclick="landingObj.completeClick()" disabled>
				<i class="fa fa-check"></i>
				Complete
			</button>				
		</div>
	</div>-->
</c:when>
<c:when test="${empty teamDocumentList}"><h2>No records available</h2></c:when>
</c:choose>
