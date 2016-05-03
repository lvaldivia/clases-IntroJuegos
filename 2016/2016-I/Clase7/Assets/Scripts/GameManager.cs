using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class GameManager : MonoBehaviour {

	public GameObject pause;
	public GameObject play;
	private Button pauseBtn;
	private Button playBtn;

	public Text scoreTxt;

	void Start (){
		Time.timeScale = 1;
		playBtn = play.GetComponent<Button> ();
		pauseBtn = pause.GetComponent<Button> ();

		pauseBtn.onClick.AddListener (() => pauseGame ());
		playBtn.onClick.AddListener (() => restartGame ());
		play.SetActive (false);
	}


	void pauseGame (){
		Time.timeScale = 0;
		play.SetActive (true);

	}


	void restartGame () {
		Time.timeScale = 1;
		play.SetActive (false);
	}


}
