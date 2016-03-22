using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour {

	// Use this for initialization
	public float speed;
	public int directionX = 1;
	public int directionY = -1;
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		Vector3 position = transform.position;
		if (position.x > 5) {
			directionX = -1;
		}
		if (position.x < -5) {
			directionX = 1;
		}
		if (position.y > 5) {
			directionY = -1;
		}
		if (position.y < -5) {
			directionY = 1;
		}
		position.x += speed*directionX* Time.deltaTime;		
		position.y += speed*directionY* Time.deltaTime;		
		transform.position = position;
	}
}
