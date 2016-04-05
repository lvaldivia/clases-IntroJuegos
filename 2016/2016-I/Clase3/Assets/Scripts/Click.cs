using UnityEngine;
using System.Collections;

public class Click : MonoBehaviour {


	ScoreController controller;
	void Start () {
		GameObject spawner = GameObject.Find ("Spawner");
		controller = spawner.GetComponent<ScoreController> ();

	}
	
	// Update is called once per frame
	void Update () {
	}

	void OnMouseDown(){
		controller.addScore ();
		Destroy (gameObject);
	}
}
