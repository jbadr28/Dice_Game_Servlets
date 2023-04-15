# Dice_Game_Servlets

## DESCRIPTION
Dice game is a web app written using Java servlets
to access to the game, the user have to eathier create a new account or Sign In using account that are already created (account are saved in the servlets context)<br>
This is a game where the player rolls three dice in any order through a user interface,. The dice are numbered 1, 2, and 3. The text field allows the user to indicate the number of the dice to roll, and the dice is rolled by clicking the "Roll the dice" button. During the game, the same dice cannot be rolled more than once. If a player rolls the same die more than once, the game stops and the player receives a score of -1.
### Scoring System
* case result(dice_1)<result(dice_2)<result(dice_2) &ensp;:<br>
&ensp;&ensp;&ensp; score = result(dice_1)+result(dice_2)+result(dice_3)
* case  result(dice_1)>result(dice_2)>result(dice_2) &ensp;: <br>
&ensp;&ensp;&ensp; score = result(dice_1)*result(dice_2)*result(dice_3)
* other cases : <br>
&ensp;&ensp;&ensp; score = 0

### Sign Up Form
<img src="https://user-images.githubusercontent.com/63529668/232076825-5e01fb87-6deb-4cb8-9ed7-d5b1d7ddc8f5.PNG">

### Sign In Form
<img src="https://user-images.githubusercontent.com/63529668/232077552-c129b767-e486-433a-a1c4-bb950eaa6962.PNG">

### Play Form
![Capture2](https://user-images.githubusercontent.com/63529668/232083787-1e061de8-8ab6-453b-b3b2-f9410d7233a5.PNG) 

After rolling a dice , the result is showed graphically using this code
```
if(request.getSession().getAttribute("result")!=null){
	int result = (int) request.getSession().getAttribute("result");
	out.print("<h3>the result is "+result+"</h3><br>");
	String image = "picture/"+result;
	out.print("<img src=\"picture/"+result+".png\" alt=\"Dice\" width=\"256\" height=\"256\">");
}
```
![Capture3](https://user-images.githubusercontent.com/63529668/232084374-a4b06a94-920f-4818-b697-fa3a1cca28f5.PNG)

### Score Popup
![Capture4](https://user-images.githubusercontent.com/63529668/232085473-400a25d1-fa10-4991-b822-89feb00f7697.PNG)

### LeaderBoard
![Capture5](https://user-images.githubusercontent.com/63529668/232087057-e37e5a9e-f176-46c7-94d6-4a62cb9f26cc.PNG)

### Tool Used
- IDE :
	- Eclipse for Entreprise Java and Web Developers
- Package :
	- jakarta.servlet
- server :
	- Apache Tomcat v10.1


