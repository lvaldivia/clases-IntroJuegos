using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour {

	// Use this for initialization
	float scaleX;
	void Start () {
		scaleX = transform.localScale.x;
	}
	
	// Update is called once per frame
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
		
}
