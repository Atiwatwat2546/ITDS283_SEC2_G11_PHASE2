const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.scheduleNotifications = functions.pubsub.schedule('every 1 hours').onRun(async (context) => {
    const now = new Date();
    const oneHourAhead = new Date(now.getTime() + (60 * 60 * 1000)); // เวลาปัจจุบัน + 1 ชั่วโมง

    const activitiesRef = admin.firestore().collection('activity');
    const querySnapshot = await activitiesRef.where('datetime', '>', now).where('datetime', '<', oneHourAhead).get();

    querySnapshot.forEach((doc) => {
        const activity = doc.data();
        const userId = activity.userId; // หรือที่เก็บ userId ไว้

        // ส่งการแจ้งเตือนไปยังอุปกรณ์ของผู้ใช้ด้วย Firebase Cloud Messaging (FCM)
        const message = {
            data: {
                title: 'กิจกรรมใกล้เข้ามาแล้ว',
                body: 'กิจกรรมใกล้เข้ามาแล้ว โปรดตรวจสอบ'
            },
            token: 'เครื่องหมายดอกจันของอุปกรณ์ผู้ใช้' // หรือ registration token ของอุปกรณ์ผู้ใช้
        };

        admin.messaging().send(message)
            .then((response) => {
                console.log('ส่งการแจ้งเตือนเรียบร้อยแล้ว:', response);
            })
            .catch((error) => {
                console.error('เกิดข้อผิดพลาดในการส่งการแจ้งเตือน:', error);
            });
    });
});
