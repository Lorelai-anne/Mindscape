using UnityEngine;


public class RainStop : MonoBehaviour
{

    [Header("Enter Trigger")]
    public BoxCollider Trigger;

    [Header("Rain")]
    public GameObject Rain;

    [Header("Enable Objects")]
    public GameObject[] Objects;

    [Header("Disable Objects")]
    public GameObject[] Dis_Objects;

    [Header("OVR Player Controller")]
    public GameObject Player;

    [Header("Delay Seconds")]
    public int DelaySeconds;




    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject == Player)
        {
            foreach (var obj in Objects)
            {
               obj.SetActive(true);
            }

            foreach (var obj in Dis_Objects)
            {
                obj.SetActive(false);
            }

            this.gameObject.SetActive(false);

            Invoke(nameof(Rain_Stop), DelaySeconds);           
        }
    }

    public void Rain_Stop()
    {
        Rain.SetActive(false);
    }

}
