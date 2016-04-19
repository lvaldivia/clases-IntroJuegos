using UnityEngine;
using System.Collections;

public class Spawner : MonoBehaviour {
	public GameObject candy1;
	public GameObject candy2;
	public GameObject candy3;
	public GameObject candy4;
	public GameObject candy5;

	public float totalTime;
	float time;

	public float reductionTime;
	float rTime;

	void Start () {
		time = 5f;
	}
	
	// Update is called once per frame
	void Update () {
		rTime += Time.deltaTime;
		/*if (rTime >= reductionTime) {
			//totalTime--;
			if(totalTime>0){
				totalTime -= 1;	
			}
			rTime = 0;
			//totalTime = totalTime - 1;
		}*/


		time += Time.deltaTime;
		if (time >= totalTime) {
			int candy = Random.Range (1, 5);
			float posX = Random.Range (-5f, 5f);
			Vector3 position = new Vector3 (posX, transform.position.y, 0);
			time = 0;
			switch(candy){
				case 1:
					Instantiate(candy1,
						position,
					transform.rotation).name ="caramelo";
					break;
				case 2:
					Instantiate(candy2,
						position,
					transform.rotation).name="gomita";
					break;
				case 3:
					Instantiate(candy3,
						position,
					transform.rotation).name = "dona";
					break;
				case 4:
					Instantiate(candy4,
						position,
						transform.rotation).name ="cupcake";
					break;
				default:
					Instantiate(candy5,
						position,
						transform.rotation).name ="frejol";
					break;
			}

		}
	}
}
