using UnityEngine;
using System.Collections;

public class BulletMovement : MonoBehaviour {

	// Use this for initialization
	public int dir;
	Rigidbody2D body;
	public float speed;
	void Start () {
		body = GetComponent<Rigidbody2D> ();
	}

	void Update () {
		body.velocity = 
			new Vector2 (body.velocity.x,
						2f * dir*speed);
	}

	void OnTriggerEnter2D(Collider2D coll){
		
		if (coll.gameObject.tag == "enemies") {
			Destroy (gameObject);
			//coll.gameObject.GetComponent<Enemy> ().life;
			//if()
			//Destroy (coll.gameObject);
		}
	}
}
