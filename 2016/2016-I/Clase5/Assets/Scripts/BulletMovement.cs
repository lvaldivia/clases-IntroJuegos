using UnityEngine;
using System.Collections;

public class BulletMovement : MonoBehaviour {

	// Use this for initialization
	public int dir;
	Rigidbody2D body;
	void Start () {
		body = GetComponent<Rigidbody2D> ();
	}

	void Update () {
		body.velocity = 
			new Vector2 (body.velocity.x,
						2f * dir);
	}
}
