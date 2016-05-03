using UnityEngine;
using System.Collections;

public class BulletDestroyer : MonoBehaviour {


	void OnTriggerEnter2D(Collider2D col){
		if (col.gameObject.tag == "bullets") {
			Destroy (col.gameObject);	
		}

		
	}

}
