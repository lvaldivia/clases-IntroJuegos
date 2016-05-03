using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour {

	Rigidbody2D body;
	Collider2D coll;
	float stageHeight;
	float boundaryX, boundaryY;
	float stageWidth;

	public float speed;
	void Start () {
		

		stageHeight = Camera.main.orthographicSize;
		body = GetComponent<Rigidbody2D> ();
		body.isKinematic = true;
		coll = GetComponent<Collider2D> ();
		coll.isTrigger = true;
		transform.localScale = new 
			Vector3(3f,3f,3f);

		boundaryX = coll.bounds.size.x / 2;
		boundaryY = coll.bounds.size.y / 2;

		//ancho del escenario
		float ratio = (float)Screen.width / (float)Screen.height;
		stageWidth = ratio * stageHeight;
	}

	// Update is called once per frame
	void Update () {
		if (Input.GetKey (KeyCode.LeftArrow)) {
			body.velocity = new Vector2 (-speed,
				body.velocity.y);
		}else if(Input.GetKeyUp (KeyCode.LeftArrow)){
			body.velocity = new Vector2 (0,
				body.velocity.y);
		}
		if (Input.GetKey (KeyCode.RightArrow)) {
			body.velocity = new Vector2 (speed,
				body.velocity.y);
		}else if(Input.GetKeyUp (KeyCode.RightArrow)){
			body.velocity = new Vector2 (0,
				body.velocity.y);
		}
		if (Input.GetKey (KeyCode.UpArrow)) {
			body.velocity = new Vector2 (body.velocity.x,
				speed);
		}else if(Input.GetKeyUp (KeyCode.UpArrow)){
			body.velocity = new Vector2 (body.velocity.x,
				0);
		}
		if (Input.GetKey (KeyCode.DownArrow)) {
			body.velocity = new Vector2 (body.velocity.x,
				-speed);
		}else if(Input.GetKeyUp (KeyCode.DownArrow)){
			body.velocity = new Vector2 (body.velocity.x,
				0);
		}
		if (transform.position.y + boundaryY > stageHeight) {
			transform.position = 
				new Vector3 (transform.position.x, 
					stageHeight - boundaryY, 
					transform.position.z);
				
		}else if(transform.position.y - boundaryY < -stageHeight){
			transform.position = 
				new Vector3 (transform.position.x, 
					-stageHeight+boundaryY, 
					transform.position.z);
		}
		if (transform.position.x + boundaryX > stageWidth) {
			transform.position = 
				new Vector3 (stageWidth - boundaryX, 
					transform.position.y, 
					transform.position.z);
		}else if(transform.position.x - boundaryX < -stageWidth){
			transform.position = 
				new Vector3 (-stageWidth + boundaryX, 
					transform.position.y, 
					transform.position.z);
		}

	}
}