using UnityEngine;
using System.Collections;

public class PlayerReduceLife : MonoBehaviour {


	private  int life;



	void Start (){

		life = GameObject.FindGameObjectsWithTag ("life").Length;
	}


	void OnTriggerEnter2D (Collider2D coll){
		if (coll.gameObject.tag == "enemies") {

			GameObject.FindGameObjectWithTag ("life").SetActive (false);
			life--;
			Destroy (coll.gameObject);

			if (life == 0) {
				Destroy (gameObject);

			}
		}
	}
}
