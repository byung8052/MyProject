package com.naver.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

@WebServlet("*.nhn")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Controller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		StringBuffer url = request.getRequestURL();
//		System.out.println(url);
		
		String uri = request.getRequestURI();
		String [] arrUri = uri.split("/");
		uri = arrUri[2];
		
		String site = null;
		System.out.println("내가 찾고 싶은 문자열: " + arrUri[2]);   // /loginbt/b.nhn
		if (uri.equals("main.nhn")) {
			site = "main.jsp";
		} else if (uri.equals("login.nhn")) {
			site = "login.jsp";
		} else if (uri.equals("loginok.nhn")) {
			site = "LoginServlet";
		} else if (uri.equals("logout.nhn")) {
			site = "logout.jsp";
		} else if (uri.equals("join.nhn")) {
			site = "join.jsp";
		} else if (uri.equals("joinok.nhn")) {
			site = "JoinServlet";
		} else if (uri.equals("emailck.nhn")) {
			site = "EmailCkServlet";
		} else if (uri.equals("search.nhn")) {
			site = "search.jsp";
		} else if (uri.equals("searchok.nhn")) {
			site = "SearchServlet";
		} else if (uri.equals("food.nhn")) {
			site = "food.jsp";
		} else if (uri.equals("foodok.nhn")) {
			site = "FoodServlet";
		} else if (uri.equals("korea.nhn")) {
			site = "korea.jsp";
		} else if (uri.equals("china.nhn")) {
			site = "china.jsp";
		} else if (uri.equals("japan.nhn")) {
			site = "japan.jsp";
		} else if (uri.equals("bunsik.nhn")) {
			site = "bunsik.jsp";
		} else if (uri.equals("fastfood.nhn")) {
			site = "fastfood.jsp";
		} else if (uri.equals("movie2.nhn")) {
			site = "MovieServlet2";
		} else if (uri.equals("movieok.nhn")) {
			site = "MovieServlet";
		} else if (uri.equals("hugi.nhn")) {
			site = "hugiPrintServlet";
		} else if (uri.equals("hugiok.nhn")) {
			site = "HugiServlet";
		} else if (uri.equals("hugidetail.nhn")) {
			site = "HugidetailServlet";
		} else {
			site = "404.jsp";
			System.out.println("error");
		}
		RequestDispatcher dis = request.getRequestDispatcher(site);
		dis.forward(request, response);

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
