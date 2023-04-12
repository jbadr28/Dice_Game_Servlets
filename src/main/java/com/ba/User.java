package com.ba;

public class User {
	
	private String userName;
	private String login;
	private String passWord;
	private boolean[] dices = new boolean[3];
	private int[] results = new int[3];
	private int bestScore;
	public User() {
		
		this.dices[0]=false;
		this.dices[1]=false;
		this.dices[2]=false;
	}
	
	public User(String userName, String login, String passWord, boolean[] dices, int bestScore) {
		this.userName = userName;
		this.login = login;
		this.passWord = passWord;
		this.dices = dices;
		this.bestScore = bestScore;
		
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public boolean[] getDices() {
		return dices;
	}
	public void setDices(boolean[] dices) {
		this.dices = dices;
	}
	public int getBestScore() {
		return bestScore;
	}
	public void setBestScore(int bestScore) {
		this.bestScore = bestScore;
	}
	public boolean equals(User user) {
		return this.getUserName().equals(user.getUserName()) || this.getLogin().equals(user.getLogin());
	}
	public boolean isDicePlayed(int diceNumber) {
		return this.dices[diceNumber-1];
	}
	public void playDice(int diceNumber) {
		this.dices[diceNumber-1] = true ;
	}
	public boolean isPlayedAllDices() {
		return isDicePlayed(1) & isDicePlayed(2) & isDicePlayed(3);
	}

	public int[] getResults() {
		return results;
	}

	public void setResults(int[] results) {
		this.results = results;
	}
	public int getRes(int i) {
		return this.results[i-1];
	}
	public void setRes(int res,int i ) {
		this.results[i-1]=res;
	}
}
