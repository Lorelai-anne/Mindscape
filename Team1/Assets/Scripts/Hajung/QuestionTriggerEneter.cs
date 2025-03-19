using UnityEngine;


public class QuestionTriggerEnter : MonoBehaviour
{
    [Header("Answer Script")]
    public AnswerManager answerManager;

    [Header("Enter Trigger")]
    public BoxCollider Trigger;

    [Header("Game Objects to Enable")]
    public GameObject[] ObjectsEnable;

    [Header("Answer options")]
    public GameObject AnswerButton;

    [Header("OVR Player Controller")]
    public GameObject Player;

    //Sound, Particles, VFX, etc
    [Header("Animated Stuff")]
    public Animator AnswerAnimator;


    public void Start()
    {
        foreach (var obj in ObjectsEnable)
        {
            obj.gameObject.SetActive(false);
        }
        AnswerButton.SetActive(false);

    }

    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject == Player)
        {
            if (ObjectsEnable != null)
            {
                foreach (var obj in ObjectsEnable)
                {
                    obj.gameObject.SetActive(true);
                }
            }

            if (AnswerButton != null)
            {
                AnswerButton.SetActive(true);
            }

            if (AnswerAnimator != null)
            {
                AnswerAnimator.enabled = true;
            }

            this.gameObject.SetActive(false);
        }
    }


}
