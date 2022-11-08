package controllers;

import controllers.action.Action;
import controllers.action.BoardDelete;
import controllers.action.BoardUpdate;
import controllers.action.BoardWrite;
import controllers.action.CommentDelete;
import controllers.action.CommentWrite;
import controllers.action.Join;
import controllers.action.Login;
import controllers.action.Logout;
import controllers.action.NoticeDelete;
import controllers.action.NoticeWrite;

public class ActionFactory {
	
	private ActionFactory() {
		
	}
	
	private static ActionFactory instance = new ActionFactory();
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		System.out.println("액션팩토리커맨드넘어옴 ?  : " + command);
		
		if(command.equals("Join")) { action = new Join(); }
		else if(command.equals("Login")) { action = new Login(); }
		else if(command.equals("Logout")) { action = new Logout(); }
		else if(command.equals("CommentWrite")) { action = new CommentWrite(); }
		else if(command.equals("CommentDelete")) { action = new CommentDelete(); }
		else if(command.equals("BoardWrite")) { action = new BoardWrite(); }
		else if(command.equals("BoardUpdate")) { action = new BoardUpdate(); }
		else if(command.equals("BoardDelete")) { action = new BoardDelete(); }
		else if(command.equals("NoticeWrite")) { action = new NoticeWrite(); }
		else if(command.equals("NoticeDelete")) { action = new NoticeDelete(); }
		
		System.out.println("액션팩토리 저장 잘됨 ? " + action);
		return action;
	}
}
