<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
  <tiles:insertAttribute name="meta" />
  <title>
    <tiles:insertAttribute name="title" ignore="true" />
  </title>
  <tiles:insertAttribute name="styles" />
</head>
<body>
<!-- header start -->
<header id="header" class="header fixed-top d-flex align-items-center">
  <tiles:insertAttribute name="header" />
</header>
<!--  header end -->

<!-- sidebar start -->
<aside id="sidebar" class="sidebar">
  <tiles:insertAttribute name="sidebar" />
</aside>
<!-- sidebar end -->

<!-- main start -->
<main id="main" class="main">
<tiles:insertAttribute name="content" />
</main>
<!-- main end -->

<!-- footer start -->
<footer id="footer" class="footer">
  <tiles:insertAttribute name="footer" />
</footer>
<!-- footer end -->
<tiles:insertAttribute name="script" />
</body>
</html>
