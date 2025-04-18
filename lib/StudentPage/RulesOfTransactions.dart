import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/Transactions/DropDownMenu.dart';

class RulesOfTransactions extends StatelessWidget {
  RulesOfTransactions({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text("شروط المعاملات")),
          body: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: ConditionsWidget(title: "شروط وقف قيد", conditions: [
                  "يجوز للطالب وقف قيده مؤقتا مرتين خلال دراسته الجامعية، ويشترط لقبول الطلب للمرة الثانية الانتظام في الدراسة والنجاح فيها ولا يجوز وقف القيد في المستوى الأول حسب لائحة شؤون الطلبة.",
                  "ينظر في موضوع وقف القيد بناءًا على طلب خطي مقدم إلى عميد الكلية خلال الشهر الأول من الفصل الجامعي أو العام الجامعي.",
                  "لا يعتمد وقف القيد إلا بعد سداد كامل الالتزامات المالية المستحقة على الطالب بحسب اللائحة المالية (رسوم الفترة التي انقضت من الفصل الجامعي محل وقف القيد + أي التزامات أخرى).",
                  "لا يحق للطالب الذي أوقف قيده دخول الاختبارات الفصلية أو التكميلية خلال فترة وقف القيد.",
                  "لا تزيد مدة إيقاف القيد عن سنتين متصلتين أو أربعة فصول جامعية منفصلة لطلبة البكالوريوس.",
                  "لا تحتسب فترة وقف القيد ضمن الفترة المحددة للحصول على الدرجة الجامعية.",
                  "التاريخ المعتمد عليه في الانسحاب ووقف القيد هو تاريخ تسليم الطلب إلى الجهة المختصة.",
                  "الطالب الذي أوقف قيده لمدة فصل جامعي أو أكثر يحق له احتساب الرسوم الدراسية التي دفعها في فترة وقف القيد كرسوم أو جزء من رسوم العام الجامعي التالي.",
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ConditionsWidget(
                    title: "الفئات التي لا يحق لها وقف القيد",
                    conditions: [
                      "الطالب المستجد في العام الجامعي الأول (مقاصة وانتظام) للنظام الفصلي أو المستجد في العام الجامعي الأول للنظام السنوي.",
                      "الطلبة المحولين الذين لم يمض على تحويلهم عام جامعي.",
                      "الطالب الراسب أو المنقطع عن الدراسة إلا بعد موافقة مجلس الكلية.",
                      "الحاصل على منحة جامعية إلا بموافقة خطية من الجهة المانحة."
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ConditionsWidget(title: "شروط إعادة قيد", conditions: [
                  "يعاد قيد الطالب بناء على طلب خطي مقدم من قبله إلى مسجل الجامعة خلال أسبوعين من بداية العام الجامعي.",
                  "في حالة انقطاع الطالب عن الدراسة ثم أعاد قيده فإنه ملزم بالخطة الدراسية للدفعة التي سيدرس معها ورسومها.",
                  "الطالب المنقطع الذي يرغب في إعادة القيد ملزم بسداد 30% من رسوم الفصل الذي أنقطع فيه وابتداء من الفصل الثاني يلزم بدفع غرامة حفظ ملف حسب اللائحة المالية."
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ConditionsWidget(
                    title:
                        "الوثائق المطلوبة من الطلبة المحولين من جامعات يمنية أخرى",
                    conditions: [
                      "بالإضافة إلى الوثائق المطلوبة من خريجي الثانوية العامة، يحضر الطالب شهادة تقديرات بالمقررات التي درسها في الجامعة المحول منها معمدا من وزارة التعليم العالي، مع صورة طبق الأصل منها، بالإضافة إلى صورة معمدة من الجامعة للمحتوى العلمي للمواد الدراسية الموجودة بكشف الدرجات علمًا أن الطالب المحول يلزم بدراسة (50%) على الأقل من المقررات الدراسية في جامعة الجزيرة بحسب لائحة شؤون الطلبة."
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ConditionsWidget(
                    title:
                        "الوثائق المطلوبة من الطلبة المحولين من جامعات خارج اليمن",
                    conditions: [
                      "بالإضافة إلى الوثائق المطلوبة من خريجي الثانوية العامة (الغير يمنيين) يحضر الطالب كشف درجات بالمواد التي درسها في الجامعة المحول منها معمداً من التعليم العالي والخارجية لذلك البلد والسفارة اليمنية هناك ووزارتي الخارجية والتعليم العالي بالجمهورية اليمنية بالإضافة إلى صورة معمدة من الجامعة التي درس بها للمحتوى العلمي للمواد الموجودة بكشف الدرجات وفي حال كون كشف الدرجات بغير اللغة العربية يتم ترجمتها بعد تصديقها."
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ConditionsWidget(
                    title: "شروط تسجيل المقررات المعادة",
                    conditions: [
                      "يحق للطالب اختبار المقررات المتبقية عليه من المستوى الأدنى مع طلاب المستوى نفسه بعد تسجيلها لدى رئيس القسم خلال فترة التسجيل التي تحددها الجامعة.",
                      "لا يلزم الطالب بالانتظام في دراسة المقررات المعادة من المستويات الأدنى إذا كان قد انتظم في دراستها واختبرها أما بالنسبة للمقررات العملية فإن الطالب ملزم بتسجيلها والانتظام فيها وفي حالة وجود تعارض في الجداول الدراسية يكون القرار لمجلس القسم والكلية.",
                      "إذا سجل الطالب المقررات المتبقية عليه لغرض الاختبار دون الدراسة فإنه ملزم بمراعات أي تغيير في مفردات تلك المقررات من خلال التواصل مع القسم المعني واستاذ المقرر الذي يدرس ذلك المقرر في الفصل الدراسي الحالي."
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ConditionsWidget(
                    title: "شروط تسجيل اختبار الدور التكميلي",
                    conditions: [
                      "يحق للطالب أن يختبر المقررات المتبقي فيها في اختبار الدور التكميلي مالم يكن الطالب منقطعا أو محرومًا بسبب الغياب أو الغش شرط تسجيل هذه المقررات لدى المختصين وسداد الرسوم المقررة وتسجل له الدرجة الدنيا (50%) مها كان المعدل الذي حصل عليه الطالب في الإعادة إلا في حالة غيابه بعذر وتم قبول العذر في فترة اختبارات الفصلين وحسب لائحة شؤون الطلبة."
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ConditionsWidget(
                    title: "شروط تسجيل الطالب الباقي للإعادة",
                    conditions: [
                      "يتم تسجيل الطالب الباقي للإعادة تلقائياً في المستوى الباقي وفقاً للخطة المعتمدة سنوياً من العمادة، ويلزم الطالب بالحضور ودفع الرسوم الدراسية عن المواد المتبقية، ويلزم بدراسة أي مقررات جديدة، أو أي تعديل في مفردات المقررات التي سبق له دراستها (التزام الطالب بما ينطبق على الدفع الجديدة).",
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ConditionsWidget(
                    title: "الشروط العامة للتحويل (الداخلي والخارجي والمقاصة)",
                    conditions: [
                      "ان يكون معدل الطالب في الثانوية العامة مطابقاً للمعدل المطلوب في الكلية والتخصص المحول إليه.",
                      "توافر شروط القبول الخاصة بالكلية أو القسم المحول إليه. ",
                      "تعبئة استمارة التحويل وتقديمها إلى مسجل الجامعة في موعد لا يتجاوز الأسبوع الرابع من بدء الدراسة.",
                      "موافقة الكلية والقسم المحول منه والمحول إليه.",
                      "لا يجوز تحويل الطلاب المنقولين إلى المستوى الرابع.",
                      "أن تحسب المدة التي قضاها الطالب في الكلية المحول منها ضمن الحد الأقصى لسنوات الدراسة المسموح بها في الكلية المحول إليها.",
                      "ألا يتجاوز تحويل الطالب مرتين خلال سنوات الدراسة في الجامعة. ",
                      "يحدد القسم العلمي المختص المحول إليه الطالب من خلال عملية (المقاصة) المقررات التي يتوجب على الطالب دراستها والمقررات التي تحتسب له من دراسته قبل النقل.",
                      "لا يجوز تحويل الطلبة الذين تقرر عليهم جزاء تأديبي إلا بعد انتهاء الفترة المقررة لتنفيذ ذلك الجزاء.",
                      "تعد المقاصة وثيقة تحديد مستوى، وليست خطة جامعية، وعلى الطالب الالتزام بالتغييرات التي قد تطرأ على الخطة الجامعية للبرنامج المحول إليه، ولا تعد وثيقة تسجيل للطالب، إلا بعد استيفاء شروط التوثيق من التعليم العالي لشهادات الطالب المقدمة.",
                      "يجب ألا يقل المحتوى العلمي للمقرر المراد عمل مقاصة له عن 80%  لما يناظره في الكلية المحول إليها.",
                      "لا يجوز عمل مقاصة لمقرر مشروع بحث التخرج او المقررات المماثلة له. ",
                      "لا تجرى المقاصة إلا بعد إحضار مفردات المقررات التي درسها الطالب معمدة من الكلية التي درس فيها.",
                      "لا يجوز مقاصة أي مقرر من مقررات المستوى النهائي أو قبل النهائي.",
                      "بعد اعتماد المقاصة وتوقيع الطالب بالعلم لا يحق له الاعتراض على المقاصة وطلب اعتماد مقررات اخرى بسبب إحضاره ما يفيد انه قد درسها في البرنامج المحول منه، ولا يحق له طلب التنازل عن مقررات معتمده في المقاصة. ",
                      "لا يحق للطالب الذي عملت له مقاصة بعد اختبارات الفصل الجامعي الثاني دخول اختبارات الدور التكميلي للعام نفسه كونه يعد من طلبة العام التالي.",
                      "يلزم الطالب بحضور المفردات المطالب بها في المستويات الدراسية الأدنى من المستوى الذي تم تسكينه فيه. ",
                      "لا يجوز قبول الطلبة المفصولين من الجامعة أو من أي جامعة أخرى."
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ConditionsWidget(title: "طلب انسحاب", conditions: [
                  "يحق للطالب أن ينسحب من الدراسة بالجامعة وفق القواعد التالية:",
                  "أن يتقدم الطالب بطلب خطي ويسلمه شخصيًا أو من ينوب عنه بوكالة رسميه معتمده إلى المسجل العام للجامعة.",
                  "--------------------------------------------------------------------------",
                  "تسلم للطالب وثيقة الانسحاب بعد استكمال الإجراءات التالية:",
                  "ملئ استمارة الانسحاب.  ",
                  "تسديد الالتزامات المالية المستحقة للجامعة على الطالب المنسحب. ",
                  "إخلاء طرفه من العهد التي بذمته (المالية والعينية) بالتوقيع من قبل المختصين في الجهات ذات العلاقة المذكورة في استمارة الإخلاء. ",
                  "تسليم البطاقة الجامعية التي بحوزته وكذا ما استخرجه الطالب خلال عام الانسحاب من وثائق أو شهادات قيد تثبت أنه طالب في الجامعة وتسليم سند استلام الوثائق المسلم له من الجامعة عند قبوله.",
                  "--------------------------------------------------------------------------",
                  "يسلم للطالب المنسحب ملفا يحتوي على ما يأتي:",
                  "أصول الوثائق التي سلمها للجامعة عند الالتحاق.",
                  "صورة استمارة الانسحاب.",
                  "سجل أكاديمي يشمل الفترة التي قضاها الطالب في الجامعة بعد سداد الرسوم المقررة.",
                  "--------------------------------------------------------------------------",
                  "تحفظ صورة من جميع الوثائق مع استمارة الانسحاب وإخلاء الطرف في الأرشيف الخاص بالمنسحبين (متضمناً توقيع الطالب باستلام الملف).",
                  "لا يحق للطالب العودة مرة أخرى للجامعة إلا في بداية العام الجامعي التالي على أن يخضع لنفس اللوائح المالية والأكاديمية المطبقة في العام الجامعي الجديد.",
                  "لا يسمح بالانسحاب من الجامعة خلال فترة الاختبارات النهائية.",
                  "لا يسمح بانسحاب الطالب الذي اتخذت ضده قرارات تأديبيه لمدة محددة قبل انتهاء هذه المدة.",
                  "إلغاء الإقامة الصادرة باسم الجامعة بالنسبة لغير اليمنيين.",
                ]),
              ),
            ],
          ),
        ));
  }
}
