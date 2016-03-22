using UnityEngine;
using System.Collections;

public class Player2 : MonoBehaviour {

	// Use this for initialization
	public float speed;
	public int directionX = -1;
	private float scaleX;
	void Start () {
		scaleX = transform.localScale.x;
	}
	
	// Update is called once per frame
	void Update () {
		Vector3 position = transform.position;
		if (position.x > 5) {
			directionX = -1;
			scaleX = scaleX * -1;
		}
		else if (position.x < -5) {
			directionX = 1;
			scaleX = scaleX * -1;
		}
		transform.localScale = new Vector3 (scaleX,
			transform.localScale.y,
			transform.localScale.z);
		position.x += speed*directionX* Time.deltaTime;			
		transform.position = position;
	}
}
