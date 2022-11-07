package controllers;

import controllers.action.Action;
import controllers.action.CommentWrite;
import controllers.action.Join;
import controllers.action.Login;

public class ActionFactory {
	
	private ActionFactory() {
		
	}
	
	private static ActionFactory instance = new ActionFactory();
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		System.out.println("af command : " + command);
		
		if(command.equals("joinAciton")) { action = new Join(); }
		else if(command.equals("login")) { action = new Login(); }
		else if(command.equals("CommentWrite")) { action = new CommentWrite(); }
		
		return action;
	}
}
