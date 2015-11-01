The tech test text:  
  
One of the important aspects of working at # is playing Foosball at lunch time.  
We play so often we would like to keep track of the games played, the results and an overall leaderboard.  
  
Your task is to create a Rails application that will allow someone to:  
  
- Create and manage users  
- Create games (using 2 - 4 team members) Manage games (winner and score)  
- Show the game history  
- Show the stats of an individual player  

##Suggested Models  
(feel free to model the application differently)  
  
#Users  
  -  first_name  
  -  last_name  
  -  username  

#Team  
  Has 1 or 2 people and play one match together  

#Game  
  Has a score from 0 - 10  

#Match  
  -  has one winning team  
  -  consists of 2 - 3 games (one team wins once they win 2 games)

##Optional Extras  
(these are just ideas - again, feel free to let your imagination go wild!)  
- Show the best combination of players  
- Show percentages (Win loss, best partner etc)  
  
##Others  
- Tests are encouraged  
- A good UI makes for a better product! A well crafted UI is not a requirement, but is definitely a bonus point.  
  
Please keep a good git log so we can see the progression of the code!