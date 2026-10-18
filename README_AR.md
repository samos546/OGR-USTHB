# StudyOS — النسخة المتكاملة

تطبيق PWA للدراسة الجامعية، مناسب لـ Windows وiPhone، بواجهة Glassmorphism رمادية مع نص أبيض ولمسات برتقالية. اللغات: العربية والفرنسية والإنجليزية.

## تشغيل سريع على Windows
1. فك ضغط ZIP كاملاً.
2. ثبّت Python 3 إذا لم يكن مثبتاً: https://www.python.org/downloads/ (فعّل Add Python to PATH).
3. شغّل `START-WINDOWS.bat` وافتح `http://localhost:4173`.
4. يعمل الوضع المحلي دون إعداد Supabase. استخدم Settings & backup لتصدير بياناتك.

## تفعيل المزامنة السحابية والملفات
1. أنشئ مشروع Supabase خاصاً بك.
2. من SQL Editor شغّل الملف `supabase/migrations/001_studyos_complete.sql` كاملاً.
3. من Project Settings → API انسخ Project URL و anon/public key فقط.
4. افتح `config.js` وضع القيم داخل `SUPABASE_URL` و`SUPABASE_ANON_KEY`. لا تضع service_role key في تطبيق المتصفح أبداً.
5. أعد تحميل التطبيق، افتح Settings & backup → Account & sync، ثم أنشئ حساباً ببريدك. إذا كان تأكيد البريد مفعّلاً، أكّد البريد قبل تسجيل الدخول.
6. جرّب إنشاء Course أو Task. بعد تسجيل الدخول ستُزامَن العناصر مع جدول `study_items`. رفع الملفات يذهب إلى bucket الخاص `study-files`.

## اختبار الميزات
- Dashboard: أنشئ مهمة بتاريخ قريب وتحقق من ظهورها في Upcoming.
- Courses/Tasks/Notes/Planner: أنشئ عنصراً وعدّله واحذفه.
- Grades: أضف مادة ونقطة ومعامل وتحقق من المعدل الموزون.
- Revision: أنشئ Flashcard ثم اختبر إظهار الإجابة وتقييمها.
- Analytics: راجع إحصاءات المهام والدروس والنقاط.
- Backup: صدّر JSON، ثم استخدم Import لاسترجاعه. احتفظ بنسخة آمنة.
- Sync: سجّل الدخول من متصفح ثانٍ على رابط HTTPS نفسه وتحقق من ظهور البيانات.
- Files: بعد إعداد Supabase، سجّل الدخول وارفع PDF صغيراً، ثم جرّب تنزيله.

## تثبيت على iPhone / نشر PWA
للتثبيت الحقيقي على iPhone يلزم نشر المجلد على استضافة HTTPS (مثلاً Netlify أو Vercel أو GitHub Pages). افتح الرابط في Safari → Share → Add to Home Screen. localhost على الكمبيوتر لا يكون متاحاً تلقائياً لهاتفك.

## ملاحظات مهمة
- وضع Local يخزن البيانات في المتصفح على نفس الجهاز فقط؛ لا تعتبره نسخة احتياطية.
- المزامنة تتطلب اتصال الإنترنت وإعداد Supabase الصحيح. ملف `config.js` مخصص لإعدادات المشروع، ولا تضع مفاتيح سرية فيه.
- بيانات النقاط محلياً تُصدّر ضمن النسخة الاحتياطية. أما البيانات السحابية فيتم تخزينها كعناصر `metadata` مرتبطة بحساب المستخدم.
- ملفات PWA الثابتة تُخزّن مؤقتاً، لكن المزامنة السحابية وتسجيل الدخول ورفع الملفات تحتاج الإنترنت.
- هذا مشروع شخصي غير رسمي وليس منتجاً تابعاً لـ USTHB.


## تحديث v3: تسجيل الدخول المنفصل والجدول
- `sign-in.html`: صفحة تسجيل دخول مستقلة.
- `sign-up.html`: صفحة إنشاء حساب مستقلة.
- `confirm.html`: صفحة نجاح/فشل تأكيد البريد الإلكتروني.
- `auth-pages.js`: تدفق المصادقة متعدد اللغات (EN/FR/AR).
- أضف رابط موقعك المنشور إلى Supabase → Authentication → URL Configuration → Redirect URLs، مع السماح بـ `https://YOUR-DOMAIN/confirm.html`. أثناء التطوير المحلي قد تحتاج السماح بـ `http://localhost:4173/confirm.html`.
- من Supabase → Authentication → Email Templates تأكد أن رابط التأكيد يستخدم `{{ .ConfirmationURL }}`. لا يكفي تشغيل الصفحة محلياً إذا لم تكن URL مسموحة في إعدادات Supabase.
- لكل حساب مساحة محلية منفصلة حسب معرّف المستخدم، وسياسات RLS في SQL تحمي البيانات السحابية. لا يتم رفع بيانات الوضع المحلي المجهولة إلى حساب بعد تسجيل الدخول.
- أضيفت صفحة «Timetable / Emploi du temps / جدول الحصص» للجدول الأسبوعي، وصفحة Planner أصبحت Agenda.
- افتح `TEST-CHECKLIST.md` لاختبار التدفق.
