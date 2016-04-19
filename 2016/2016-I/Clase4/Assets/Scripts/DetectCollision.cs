using UnityEngine;
using System.Collections;

public class DetectCollision : MonoBehaviour {

	string enemyType = "Candy";
	void Start () {

	}

	void OnCollisionEnter2D(Collision2D collision){
		if (collision.gameObject.tag == enemyType) {
			Destroy (collision.gameObject);	
		}

	}
}
