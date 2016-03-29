using UnityEngine;
using System.Collections;

public class Player2 : MonoBehaviour {

	// Use this for initialization
	public float speed;
	public int directionX = -1;
	public int rebote;
	public float boost;
	private int tmp_rebotes;
	private float scaleX;
	void Start () {
		scaleX = transform.localScale.x;
		tmp_rebotes = 0;
	}
	
	// Update is called once per frame
	void Update () {
		Vector3 position = transform.position;
		if (position.x > 5) {
			directionX = -1;
			tmp_rebotes++;
			scaleX = scaleX * -1;
		}
		else if (position.x < -5) {
			tmp_rebotes++;
			directionX = 1;
			scaleX = scaleX * -1;
		}
		/*if (tmp_rebotes > 0) {
			if (tmp_rebotes % rebote == 0) {
				
			}
		}*/
		if (tmp_rebotes >= rebote) {
			tmp_rebotes = 0;
			speed += boost;
		}

		transform.localScale = new Vector3 (scaleX,
			transform.localScale.y,
			transform.localScale.z);
		position.x += speed*directionX* Time.deltaTime;			
		transform.position = position;
	}
}
