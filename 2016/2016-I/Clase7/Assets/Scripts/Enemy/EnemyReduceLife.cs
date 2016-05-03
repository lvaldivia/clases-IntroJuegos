using UnityEngine;
using System.Collections;

public class EnemyReduceLife : MonoBehaviour {

	public int life=2;
	public GameObject explosion;
	void OnTriggerEnter2D (Collider2D coll){
		if (coll.gameObject.tag == "bullets") {
			Destroy (coll.gameObject);
			life--;
			if (life == 0) {
				Instantiate (explosion, 
					transform.position, 
					transform.rotation);
				Destroy (gameObject);
			}
		}
	}
}
