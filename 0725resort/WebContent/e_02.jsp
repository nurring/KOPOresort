<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*,java.text.SimpleDateFormat,java.util.Calendar"%>
<html>
<head>
<title>후기</title>
<%
	Calendar calt = Calendar.getInstance();
	SimpleDateFormat sdt = new SimpleDateFormat("YYYY-MM-dd");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://192.168.56.102:3306/kopo05", "root", "dc190105");
	Statement stmt = con.createStatement();
	String QueryTxt;
	QueryTxt = String.format(
			"SELECT id, relevel, title, date, viewcnt FROM resortboarditem where board_id = 2 ORDER BY rootid DESC, relevel ASC;");
	ResultSet rset = stmt.executeQuery(QueryTxt);

	int relevelnum = 0;
	String relevel;
%>
<style>
body {
		  background-color: #ebebeb;
	}
</style>
</head>
<body>
<div style="height:103px; background-color:#200000;"></div>
	<div class="container" style="padding:150px 50px 50px 50px; min-height:720px;">
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th>no</th>
					<th>제목</th>
					<th>등록일</th>
					<th>view</th>
				</tr>
			</thead>
			<%
				while (rset.next()) {
			%>
			<tr>
				<td align=center><%=rset.getInt(1)%></td>
				<td>
					<%
						relevel = rset.getString(2);
							relevelnum = relevel.length();
							if (relevelnum != 0) {
								while (relevelnum != 0) {
									out.print("　　");
									relevelnum--;
								}
								out.print(">[RE] ");
							}
					%> <a href=?contentPage=e_02_view.jsp&key=<%=rset.getInt(1)%>><%=rset.getString(3)%></a>
				</td>
				<td align=center><%=rset.getDate(4)%></td>
				<td align=center><%=rset.getInt(5)%></td>
			</tr>
			<%
				}
			%>
		</table>
		<table>
			<tr>
				<td><button type="button" class="btn btn-dark"
						onclick="location.href='e_01_insert.jsp?board=2'">새글
						쓰기</button></td>
			</tr>
		</table>
		<br><br><br><br>
	</div>
</body>
</html>