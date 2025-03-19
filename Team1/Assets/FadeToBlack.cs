using UnityEngine;
using UnityEngine.SceneManagement;

public class FadeToBlack : MonoBehaviour
{

    [Header("OVR Player Controller")]
    public GameObject Player;

    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject == Player)
        {
            SceneManager.LoadScene(1);
        }
    }
}
