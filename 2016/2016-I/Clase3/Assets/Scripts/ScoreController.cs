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

	public void addScore(){
		score = score + 10;
		scoreText.text = "Score: " + score;
		clicks++;
		clickText.text = clicks+"";
	}
		
	// Update is called once per frame
	void Update () {
	
	}
}
