using UnityEngine;
using System.Collections;

public class Enemy : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	Collider2D collider;
	float boundaryX;
	float stageWidth;
	[HideInInspector]


	void Start () {
		body = GetComponent<Rigidbody2D> ();
		collider = GetComponent<Collider2D> ();
		body.isKinematic = true;
		collider.isTrigger = true;
		transform.localScale = new Vector3(3f,3f,3f);

		boundaryX = collider.bounds.size.x;
		float stageHeight = Camera.main.orthographicSize;
		float ratio = 
			(float)Screen.width / (float)Screen.height;
		stageWidth = stageHeight * ratio;



		transform.position = 
			new Vector3 (Random.Range 
				(-stageWidth+(boundaryX/2),stageWidth-(boundaryX/2)),
			transform.position.y, transform.position.z);

	}




	// Update is called once per frame
	void Update () {
		body.velocity = new Vector2 (body.velocity.x,-2f);
	}
}
