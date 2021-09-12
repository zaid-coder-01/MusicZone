<%@page import="helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="entity.Songs"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%
if(request.getParameter("key")!=null &&request.getParameter("key")!="")
{
    
    
    String key=request.getParameter("key");
    
  
    try{
    	
    SessionFactory sf=FactoryProvider.getFactory();
         Session s=  sf.openSession();   
    	
         Query q=s.createQuery("from Songs where songName like :za order by RAND() ");
        
         q.setParameter("za","%"+key+"%");
         q.setMaxResults(4);
        
         List<Songs> lis=q.list();
         
         for( Songs us:lis)
         {
        	    %>
        	    <li id="op" class="list-group-item" style=" cursor: pointer; background-color: rgba(0,0,0,0.9); color: white;"><%= us.getSongName()%></li>
<% } 
         
s.close();

    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
}
%>