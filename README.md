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
  <li>Pokémon count by generation<br>
    <img src="https://github.com/Aimee-Iwashita/Pokemon-Statistics/blob/main/images/ss5.png" alt="Pokémon count by generation", style="width:130px;height:200px;"></li>
  <li>There are 18 types; Normal, Fire, Water, Grass, Flying, Fighting, Poison, Electric, Ground, Rock, Psychic, Ice, Bug, Ghost, Steel, Dragon, Dark, and Fairy.</li>
  <li>Overall type distribution:<br>
    <img src="https://github.com/Aimee-Iwashita/Pokemon-Statistics/blob/main/images/pokemon_image1.png" alt="Bar chart of pokémons count by type", style="width:650px;height:500px;"><br>
    Water-type Pokémon are the most common, followed by Normal, Grass, Psychic, and Flying types. In contrast, Ice-type Pokémon are the least common, followed by Fairy and Ghost types.</li>
  <li>We have 118 legendary pokémons and 954 non-legendary pokémons.</li>
  <li>Average stats of legendary pokémons vs non-legendary pokémons: <img src="https://github.com/Aimee-Iwashita/Pokemon-Statistics/blob/main/images/ss1.png" alt="average stats of legendary and non-legendary pokémons"> <br>
    Legendary Pokémon have higher averages across all stat attributes, suggesting that, on average, they are stronger than non-legendary Pokémon. In Section 2, we will further investigate the differences between legendary and non-legendary Pokémon.</li>
  <li>Average stats by type:<br>
    <img src="https://github.com/Aimee-Iwashita/Pokemon-Statistics/blob/main/images/ss4.png" alt="average stats pokémons by type", style="width:550px;height:450px;">
    <img src="https://github.com/Aimee-Iwashita/Pokemon-Statistics/blob/main/images/pokemon_image2.png" alt="total stats of pokémons by type", style="width:700px;height:500px;"><br>
    On average, Dragon-type Pokémon tend to have higher overall statistics compared to other types, while Bug-type Pokémon generally have lower overall statistics in comparison. </li>
</ul>



## 1. Identifying the top 3 Pokémons for each stats attributes
This section addresses the first question: "Which Pokémon has the highest stats?" Using SQL, I identified the top Pokémon for each stat category. 
You can find the SQL code files used for this analysis <a href="https://github.com/Aimee-Iwashita/Pokemon-Statistics/blob/main/pokemon.2.sql"> here </a>. <br>
<br>
### Total 
<table>
  <tr>
    <th>Rank</th>
    <th>Name</th>
    <th>Total</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Eternamax Eternatus</td>
    <td>1125</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Mega Mewtwo X <br>
      Mega Mewtwo Y <br>
      Mega Rayquaza</td>
    <td>780</td>
  </tr>
  <tr>
    <td>3</td>
    <td>	Primal Groudon <br>
      Primal Kyogre</td>
    <td>770</td>
  </tr>
</table>

### Attack
<table>
  <tr>
    <th>Rank</th>
    <th>Name</th>
    <th>Attack</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Mega Mewtwo X</td>
    <td>190</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Mega Heracross</td>
    <td>185</td>
  </tr>
  <tr>
    <td>3</td>
    <td>	Kartana</td>
    <td>181</td>
  </tr>
</table>

### Defense
<table>
  <tr>
    <th>Rank</th>
    <th>Name</th>
    <th>Defense</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Eternamax Eternatus</td>
    <td>250</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Shuckle <br>
      Mega Aggron <br>
      Mega Steelix</td>
    <td>230</td>
  </tr>
  <tr>
    <td>3</td>
    <td>	Stakataka</td>
    <td>211</td>
  </tr>
</table>

### Special Attack
<table>
  <tr>
    <th>Rank</th>
    <th>Name</th>
    <th>Special Attack</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Mega Mewtwo Y</td>
    <td>194</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Deoxys Attack Forme <br>
        Mega Rayquaza <br>
        Primal Kyogre</td>
    <td>180</td>
  </tr>
  <tr>
    <td>3</td>
    <td>Mega Alakazam</td>
    <td>175</td>
  </tr>
</table>

### Special Defense
<table>
  <tr>
    <th>Rank</th>
    <th>Name</th>
    <th>Special Defense</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Eternamax Eternatus</td>
    <td>250</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Shuckle</td>
    <td>230</td>
  </tr>
  <tr>
    <td>3</td>
    <td>Regice</td>
    <td>200</td>
  </tr>
</table>

### HP
<table>
  <tr>
    <th>Rank</th>
    <th>Name</th>
    <th>HP</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Blissey <br> Eternamax Eternatus</td>
    <td>255</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Chansey</td>
    <td>250</td>
  </tr>
  <tr>
    <td>3</td>
    <td>Guzzlord</td>
    <td>223</td>
  </tr>
</table>

### Speed
<table>
  <tr>
    <th>Rank</th>
    <th>Name</th>
    <th>Speed</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Regieleki</td>
    <td>200</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Deoxys Speed Forme</td>
    <td>180</td>
  </tr>
  <tr>
    <td>3</td>
    <td>Ninjask</td>
    <td>160</td>
  </tr>
</table>

## 2. Comparing Total Stats of Legendary and Non-Legendary Pokémon Using Bootstrapping
In this section, we aim to compare the total stats (sum of all indivisual stats) between legendary and non-legendary Pokémon. 

<img src="https://github.com/Aimee-Iwashita/Pokemon-Statistics/blob/main/images/pokemon_image4.png" alt="Boxplot of total stats by legendary status">

This box plot reveals a noticeable difference in the total stats between legendary and non-legendary Pokémon. Non-legendary Pokémon exhibit a relatively symmetrical distribution, indicating that their total stats are evenly spread around the median. In contrast, legendary Pokémon show a left-skewed distribution, with most of their total stats clustered towards the higher end. Additionally, there is an outlier with an exceptionally high total stat, significantly above the upper quartile, highlighting the presence of an extremely powerful legendary Pokémon.

### ANOVA Assumption Checks
- Independence: The data violates this assumption due to the evolutionary line of Pokémon, where the stats of a Pokémon are dependent on those of the previous evolution.
- Normality: The Q-Q plot suggests the violation of the normality assumption, evident in the points deviating noticeably from the dotted line. This is further supported by the Shapiro-Wilk Normality test, with a very low p-value (<< 0.05), leading to the rejection of the null hypothesis of normality. <br>
<img src="https://github.com/Aimee-Iwashita/Pokemon-Statistics/blob/main/images/pokemon_image5.png" alt="Q-Q plot">
<img src="https://github.com/Aimee-Iwashita/Pokemon-Statistics/blob/main/images/pokemon_image6.png" alt="Shapiro-Wilk Normality test">
- Equality of variance: The residual vs. fitted plot displays a random and consistent scatter around the horizontal line at 0 for both legendary and non-legendary groups. This observation indicates that the variability of residuals is similar across all levels of the fitted values, satisfying the equality of variance assumption. <br>
<img src="https://github.com/Aimee-Iwashita/Pokemon-Statistics/blob/main/images/pokemon_image7.png" alt="Residual vs. fitted plot">
- Random Sampling - This assumption is not applicable to this dataset since it comprises data for all Pokémon from generations 1 to 8.

This dataset does not meet the requirements for ANOVA due to violations of the independence and normality assumptions. However, bootstrapping serves as a robust alternative to ANOVA because it does not rely on these assumptions. Bootstrapping is a resampling technique that generates multiple samples from the observed data, allowing for the estimation of parameters and confidence intervals without strict adherence to distributional assumptions or independence among observations.

### Bootstrapping Result
With 95% confidence, the difference in total stats between legendary and non-legendary Pokémons falls within the range of 181.13 to 218.14 points. This means that, on average, legendary Pokémon have total stats that are 181.13 to 218.14 points higher than non-legendary Pokémon.<br>
With 95% confidence, the median difference in total stats between legendary and non-legendary Pokémon falls within the range of 145 to 180 points. This means that, on average, the median total stats of legendary Pokémon are between 145 and 180 points higher than those of non-legendary Pokémon.

### Conclusion
Since both confidence intervals do not contain 0, there is a statistically significant advantage in total stats for legendary Pokémon over non-legendary Pokémon, whether considering the average or the median values. Therefore, we conclude that legendary Pokémon generally have higher total stats compared to non-legendary Pokémon.

## 3. Type combinations




