using UnityEngine;
using System.Collections;

public class DetectCollision : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}

	void OnCollisionEnter2D(Collision2D collision){
		if (collision.gameObject.name != "player") {
			Destroy (collision.gameObject);	
		}

	}
}
