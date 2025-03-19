using UnityEngine;

public class AnswerManager : MonoBehaviour
{

    [Header("Enter Trigger")]
    public BoxCollider Trigger;


    [Header("OVR Player Controller")]
    public GameObject Player;

    //Sound, Particles, VFX, etc
    [Header("Animated Stuff")]
    public Animator[] AnswerAnimator;
    public string TriggerName;

    [Header("Objects to Turn Off")]
    public GameObject[] Objects;

    [Header("Objects to Turn On")]
    public GameObject[] On_Objects;

    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject == Player)
        {
            Objects[0].SetActive(false);
        }

        foreach (GameObject obj in Objects)
        {
            obj.SetActive(false);
        }

        foreach (GameObject obj in On_Objects)
        {
            obj.SetActive(true);
        }

        AnswerAnimator[0].SetTrigger(TriggerName);

    }

}
