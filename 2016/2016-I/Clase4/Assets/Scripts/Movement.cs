using UnityEngine;
using System.Collections;

public class Movement : MonoBehaviour {

	// Use this for initialization
	float speed = 5f;
	GameObject limit;
	void Start () {
		limit = GameObject.Find ("BottomLimit");
	}
	
	// Update is called once per frame
	void Update () {
		Vector3 position = transform.position;
		position.y -= speed * Time.deltaTime;
		transform.position = position;
		if(position.y<limit.transform.position.y){
			Destroy(gameObject);
		}
	}
}
