# Pokémon Analysis

Pokémon, short for "Pocket Monsters," is a popular franchise launched by Nintendo, Game Freak, and Creatures in 1996. It revolves around fictional creatures that players can capture and train to battle each other. There are now over 1000 unique species of Pokémon, each with distinct attributes. <br><br>
This report explores and analyzes Pokémon statistics using SQL and R. The analysis focuses on identifying the top Pokémon for each stat (Attack, Defense, Special Attack, Special Defense, HP, Speed, and Total) and examining the difference between the total stats of legendary and non-legendary Pokémon using bootstrapping. Furthermore, a heatmap is created to reveal patterns in type combinations. The dataset used for this analysis can be found on Kaggle 
(<a href="https://www.kaggle.com/datasets/abcsds/pokemon">  https://www.kaggle.com/datasets/abcsds/pokemon </a>). <br>

## Main Questions
<ol>
  <li>Which pokémon has the highest stats?</li>
  <li>Is there a difference between the total stats of legendary and non-legendary pokémon?</li>
  <li>What are the most common combinations of types?</li>
</ol>
<br>

## Data Exploration
First, I conducted an initial data exploration using SQL and R to gain a comprehensive overview of the dataset. <br>
The SQL code used for the data exploration can be found <a href=""> here</a>. The R codes can be found <a href=""> here</a>.
<br><br>
<ul>
  <li>This data contains total of 1072 pokémons from generation 1 to generation 8.</li>
  <li>There are 18 types; Normal, Fire, Water, Grass, Flying, Fighting, Poison, Electric, Ground, Rock, Psychic, Ice, Bug, Ghost, Steel, Dragon, Dark, and Fairy.</li>
  <li>We have 118 legendary pokémons and 954 non-legendary pokémons.</li>
</ul>



## 1. Top 3 Pokémons for each stats attributes
This section addresses the first question: "Which Pokémon has the highest stats?" Using SQL, I identified the top Pokémon for each stat category. 
You can find the SQL code files used for this analysis <a href="https://github.com/Aimee-Iwashita/Pokemon-Statistics/blob/main/pokemon.2.sql"> here </a>.


## 2. Difference between the legendary pokémon and non-legendary pokémons

## 3. Type combinations
