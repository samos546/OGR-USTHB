# StudyOS v3 — قائمة اختبار

1. ضع `SUPABASE_URL` و`SUPABASE_ANON_KEY` في `config.js` (مفتاح publishable/anon فقط، وليس service_role).
2. شغّل `START-WINDOWS.bat` ثم افتح `http://localhost:4173`.
3. افتح `sign-up.html`، أنشئ حساباً، وتحقق من وصول رسالة البريد.
4. في Supabase Authentication → URL Configuration أضف `http://localhost:4173/confirm.html` إلى Redirect URLs، وكذلك رابط الإنتاج HTTPS لاحقاً.
5. افتح رابط التأكيد من البريد؛ يجب أن تظهر صفحة تأكيد StudyOS.
6. سجّل الدخول من `sign-in.html`؛ يجب أن ينتقل إلى `index.html`.
7. أنشئ مادة ونقطة وملفاً، ثم تحقق من ظهورها في Supabase.
8. سجّل الخروج، أنشئ حساباً آخر، وتحقق أن بيانات الحساب الأول لا تظهر في الحساب الثاني.
9. جرّب مبدّل اللغة EN/FR/AR في صفحة الدخول وفي التطبيق؛ العربية يجب أن تتحول إلى RTL.
10. افتح Timetable وأضف حصصاً في أيام مختلفة؛ راجع عرض الأسبوع ثم حدّث الصفحة.
11. افتح Agenda وأضف حدثاً بتاريخ محدد.
12. اختبر النسخ الاحتياطي JSON والاستعادة.

إذا تعذر تسجيل الدخول: تحقق من Project URL والمفتاح، حالة Auth/Email provider، تأكيد البريد، Site URL وRedirect URLs، وسياسات SQL/RLS.
