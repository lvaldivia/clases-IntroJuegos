using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour {

	// Use this for initialization
	ScoreController controller;
	float scaleX;
	void Start () {
		scaleX = transform.localScale.x;
		controller = GameObject.Find ("Spawner")
						.GetComponent<ScoreController> ();
	}

	void Update () {
		Vector3 position = transform.position;
		if (Input.GetKey (KeyCode.LeftArrow)) {
			position.x -= 20f*Time.deltaTime;
			transform.localScale = new Vector3 (-scaleX,
				transform.localScale.y, transform.localScale.z);
			
		}
		if (Input.GetKey (KeyCode.RightArrow)) {
			position.x += 20f*Time.deltaTime;
			transform.localScale = new Vector3 (scaleX,
				transform.localScale.y, transform.localScale.z);

		}
		transform.position = position;
	}

	void OnCollisionEnter2D(Collision2D collision){
		//print (collision);
		if (collision.gameObject.tag == "Candy") {
			controller.addScore (collision.gameObject.name);
			Destroy (collision.gameObject);
		}
	}

	void OnTriggerEnter2D(Collider2D collider){
		if (collider.gameObject.tag == "Candy") {
//			Destroy (collider.gameObject);
		}
	}
		
}
