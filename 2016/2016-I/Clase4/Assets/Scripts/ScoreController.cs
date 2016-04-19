using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class ScoreController : MonoBehaviour {

	// Use this for initialization

	public Text scoreText;
	public Text clickText;
	int score;
	int clicks;
	void Start () {
		score = 0;
		scoreText.text = "Score: "+score;
		clickText.text = "Clicks "+clicks;
	}

	public void addScore(string candy){

		switch (candy) {
			case "caramelo":
				score +=10;
				break;
			case "dona":
				score = score * 10;			
				break;
			case "cupcake":
				score =  score * 2;
				break;
		case "gomita":
				if (score % 2 == 0) {
					score += 150;
				} else {
					score += 10;
				}
				break;
		case "frejol":
				if (score % 5 == 0) {
					score += 150;
				}
				break;
		}
		scoreText.text = "Score: " + score;
		clicks++;
		clickText.text = clicks+"";
	}
		
	// Update is called once per frame
	void Update () {
	
	}
}
