using UnityEngine;
using System.Collections;

public class BulletGenerator : MonoBehaviour {

	public GameObject bullet;
	float delay;
	void Start () {
		delay = 0;
	}
	
	// Update is called once per frame
	void Update () {
		delay += Time.deltaTime;
		if (Input.GetKey(KeyCode.Space)) {
			if (delay >= 0.3f) {
				delay = 0;
				Instantiate (bullet, 
					transform.position, 
					transform.rotation);	
			}
		}
	}
}
