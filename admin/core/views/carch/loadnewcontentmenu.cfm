 <!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on 
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with 
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without 
Mura CMS under the license of your choice, provided that you follow these specific guidelines: 

Your custom code 

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /requirements/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work 
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL 
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your 
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License 
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->
<cfset typeList="Page,Link,File,Portal,Calendar,Gallery">
<cfset rsSubTypes=application.classExtensionManager.getSubTypes(siteID=rc.siteID,activeOnly=false) />
<cfset request.layout=false>
<cfoutput>
<ul class="nav nav-pills nav-stacked">
<cfif rc.ptype neq 'Gallery'>
	<cfloop list="#typeList#" index="i">
	<li class="new#i#"><a href="index.cfm?muraAction=cArch.edit&contentid=&parentid=#HTMLEditFormat(rc.contentid)#&type=#i#&topid=#HTMLEditFormat(rc.topid)#&siteid=#HTMLEditFormat(rc.siteID)#&moduleid=00000000000000000000000000000000000&ptype=#HTMLEditFormat(rc.type)#" id="new#i#Link">#application.rbFactory.getKeyValue(session.rb,"sitemanager.add#lcase(i)#")#</a></li>
	<cfquery name="rsItemTypes" dbtype="query">
	select * from rsSubTypes where lower(type)='#lcase(i)#' and lower(subtype) != 'default'
	</cfquery>
	<cfloop query="rsItemTypes">
	<li class="new#i#"><a href="index.cfm?muraAction=cArch.edit&contentid=&parentid=#HTMLEditFormat(rc.contentid)#&type=#i#&subType=#rsItemTypes.subType#&topid=#HTMLEditFormat(rc.topid)#&siteid=#HTMLEditFormat(rc.siteID)#&moduleid=00000000000000000000000000000000000&ptype=#HTMLEditFormat(rc.type)#" id="new#i#Link">#application.rbFactory.getKeyValue(session.rb,"sitemanager.add#lcase(i)#")# / #rsItemTypes.subType#</a></li>
	</cfloop>
	</cfloop>
<cfelse>
	<li class="newGalleryItem"><a href="index.cfm?muraAction=cArch.edit&contentid=&parentid=#HTMLEditFormat(rc.contentid)#&type=File&topid=#HTMLEditFormat(rc.topid)#&siteid=#HTMLEditFormat(rc.siteID)#&moduleid=00000000000000000000000000000000000&ptype=#HTMLEditFormat(rc.type)#" id="newGalleryItemLink">#application.rbFactory.getKeyValue(session.rb,"sitemanager.addgalleryitem")#</a></li>
	<cfquery name="rsItemTypes" dbtype="query">
	select * from rsSubTypes where lower(type)='file' and lower(subtype) != 'default'
	</cfquery>
	<cfloop query="rsItemTypes">
	<li class="newFile"><a href="index.cfm?muraAction=cArch.edit&contentid=&parentid=#HTMLEditFormat(rc.contentid)#&type=File&subType=#rsItemTypes.subType#&topid=#HTMLEditFormat(rc.topid)#&siteid=#HTMLEditFormat(rc.siteID)#&moduleid=00000000000000000000000000000000000&ptype=#HTMLEditFormat(rc.type)#" id="newGalleryItem">#application.rbFactory.getKeyValue(session.rb,"sitemanager.addgalleryItem")# / #rsItemTypes.subType#</a></li>
	</cfloop>
	<li class="newGalleryItemMulti"><a href="index.cfm?muraAction=cArch.multiFileUpload&contentid=&parentid=#HTMLEditFormat(rc.contentid)#&type=File&topid=#HTMLEditFormat(rc.topid)#&siteid=#HTMLEditFormat(rc.siteID)#&moduleid=00000000000000000000000000000000000&ptype=#HTMLEditFormat(rc.type)#" id="newGalleryItemMultiLink">#application.rbFactory.getKeyValue(session.rb,"sitemanager.addmultiitems")#</a></li>
</cfif> 
  </ul>
</cfoutput>
