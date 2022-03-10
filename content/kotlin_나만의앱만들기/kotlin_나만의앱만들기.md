---
emoji: 🏃
categories: language
title: 나만의 앱만들기
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
cover: 
description: circularview, kotlin, viewholder, Room, corutine
---

## 휴,, 내 생각

- [소스 코드 레퍼지터리는 하이퍼 링크를 따라가면 볼 수 있다](https://github.com/GoBeromsu/Circular-Timer)

* 에바 삽질을 너무 해버렸어 좀 배운 것들은 확실히 있는데 간단하게 만드려는 의도와 다르게 인터넷에서 배우다보니 나도 모르게 왜 안되지? 하면 데이터베이스 뿐 만아니라 mvmm 패턴도 같이 막 적용하려고 하다보니 걍 머리가 팡 터질 뻔 했다.
* 이제 Adapter 개념은 확실히 알 것 같다.
* lifecycle 주기도 제대로 모르는데 이 곳 저 곳에서 배운 내 잘못이다. 휴
* 머리도 식힐겸 정리도 할 겸 글 쓴다.

## circular view

```kotlin

    // oncreate가 붙은 함수는 생성 될 때 한 번 실행되는 메소드이다.
    // 커스텀한 뷰를 액티비티에 붙이기 위한 접착제이다

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PlanAdapter.CustomViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.[xml 파일 이름], parent, false)
        return CustomViewHolder(view)
    }

    // 객체 리스트의 개수를 반환
    override fun getItemCount(): Int {
        return [모델 또는 객체].size
    }

    override fun onBindViewHolder(holder: PlanAdapter.CustomViewHolder, position: Int) {
    }
    class CustomViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
      // 레이아웃 내의 컴포넌트들을 재정의
      // circular view의 렉 문제 때문에 캐시를 이용하기 위함이라고도함
      // 요즘은 안드로이드 extension 때문에 findviewid 안써도 되서 행복이지
        var name = itemView.tv_name

    }
}
```

```kotlin
class MainActivity : AppCompatActivity() {

    private val newPlanActivityRequestCode = 1
    private lateinit var planViewModel: PlanViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val adapter = CustomAdapter(this)

        rv_planlist.adapter =adapter
        rv_planlist.layoutManager = LinearLayoutManager(this)

        planViewModel = ViewModelProvider(this,PlanViewModel.Factory(application)).get(PlanViewModel::class.java)

    }

}
```

- 메인 액티비티에서는 만들어진 어댑터를 메인 엑티비티의 xml의 listview에 연결한다
  - 왜냐면 커스텀 어댑터는 3단계를 거친다.
    - mainActivity xml -- mainActivity 내 circularview - circular view에 들어갈 객체
    - 저 객체를 자기 맘대로 재정의 하기 때문에 커스텀 어댑터라고한다
- LayoutManger를 세팅하면 끝!
  - 상황에 따라서 어댑터에 배열 넣어서 뷰 구현하는 예제들 있는데 DB가 없어서 예제를 따라하는 건 간단하다
  - LayoutManager는 3개 있다.

## Adapter 또는 MainActivity가 아닌 곳에서 DB 접근

- fragment 쓰면 이럴 일은 없을 거 같은데? 공부가 좀 모자라다

### interface를 이용하는 방법

- 난 Delete를 구현하기 위해 이 방법을 사용했다. adapter에 delete 버튼 리스너를 넣을 생각이었기 때문이다.

#### DeleteBtnListener

  ```kotlin
  interface DeleteBtnListener {
      fun deleteBtnClicked(plan:Plan)
  }
  ```

  인터페이스를 선언하고 인터페이스 내에 사용할 메소드를 선언한다

#### MainActivity

  ```kotlin
  class MainActivity : AppCompatActivity(), DeleteBtnListener {

      private lateinit var planViewModel: PlanViewModel

  override fun onCreate(savedInstanceState: Bundle?) {

        // 어댑터 정의
        adapter = PlanAdapter(this, this)
        // viewModelProvider로 모델 받아오기
        planViewModel = ViewModelProvider(this).get(PlanViewModel::class.java)

        planViewModel.allPlan.observe(this, Observer { plan ->
            plan?.let { adapter.setPlans(it) }
        })
    }

      override fun deleteBtnClicked(plan: Plan) {
          planViewModel.delete(plan)
      }
  }
  ```

- 메인 액티비티에서는 인터페이스를 받은 후 인터페이스 메소드를 재정의 한다.
- 메소드 deleteBtnClicked를 보면 planViewModel 있음을 알 수 있다.

- 이 viewModel은 메인 액티비티에서 정의해서 쭉 사용할 viewModel이다

  ```kotlin
  override fun onCreate(savedInstanceState: Bundle?) {
   adapter = PlanAdapter(this, this)
  }
  ```

  - onCreate 같은 경우 액티비티가 생성될 때 처음 실행되는 메소드이다
  - 아래에서 말하겠지만 PlanAdapter에서도 deleBtnListener를 상속받는데 메인 액티비티에서 재정의 된 리스너를 연결하는 것이다.

#### Plan Adapter

```kotlin
class PlanAdapter(val context: Context, deletelistener: DeleteBtnListener) :RecyclerView.Adapter<PlanAdapter.Holder>() {
      private var DeleteBtnListener: DeleteBtnListener = deletelistener

     inner class Holder(itemView: View) : RecyclerView.ViewHolder(itemView) {

        val content = itemView.tv_context
        val timeProgress = itemView.progress
        val start = itemView.bt_start
        val reset = itemView.bt_reset
        val delete = itemView.bt_delete

        fun bind(plan: Plan) {
            content.text = plan.content

            timeProgress.setOnTouchListener(OnTouchListener { v, event -> true })

            delete.setOnClickListener(View.OnClickListener {
                DeleteBtnListener.deleteBtnClicked(plan)
                notifyDataSetChanged()
            })
        }
    }
}
```

- 이너 클래스로 holer가 생성된 것을 볼 수 있는데 recyclerview에서는 viewholder에 담아서 뷰에 뿌리기 때문에 필요하다
- bind() 메소드를 보면 deleteBtnClicked()를 사용하는 것을 볼 수 있다.
