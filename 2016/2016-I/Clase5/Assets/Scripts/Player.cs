using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour {

	Rigidbody2D body;
	bool up,down,right,left;
	void Start () {
		body = GetComponent<Rigidbody2D> ();
		body.isKinematic = true;
		transform.localScale = new 
			Vector3(3f,3f,3f);
	}

	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown (KeyCode.LeftArrow)) {
			left = true;
		}else if(Input.GetKeyUp (KeyCode.LeftArrow)){
			left = false;
		}

		if (Input.GetKeyDown (KeyCode.RightArrow)) {
			right = true;
		}else if(Input.GetKeyUp (KeyCode.RightArrow)){
			right = false;
		}

		if (Input.GetKeyDown (KeyCode.UpArrow)) {
			up = true;
		}else if(Input.GetKeyUp (KeyCode.UpArrow)){
			up = false;
		}

		if (Input.GetKeyDown (KeyCode.DownArrow)) {
			down = true;
		}else if(Input.GetKeyUp (KeyCode.DownArrow)){
			down = false;
		}


		if (left) {
			body.velocity = new Vector2 (-2f, body.velocity.y);
		}
		if (right) {
			body.velocity = new Vector2 (2f, body.velocity.y);
		}
		if (up) {
			body.velocity = new Vector2 (body.velocity.x, 2f);
		} 
		if(down){
			body.velocity = new Vector2 (body.velocity.x, -2f);
		}

		if (!left && !right && !up && !down ) {
			body.velocity = new Vector2 (0, 0);
		}



	}
}