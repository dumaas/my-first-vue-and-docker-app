<template>
 <li>
   <h2>{{ friend.name }}</h2>
   <button @click="toggleDetails">Show Details</button>
   <ul v-if="detailsVisible">
     <li><strong>Phone:</strong> {{ friend.phone }}</li>
     <li><strong>Email:</strong> {{ friend.email }}</li>
   </ul>
 </li>
</template>

<script>
export default {
  data() {
    return {
      detailsVisible: false,
      friend: {
            id: 'meredith',
            name: 'Meredith Bakke',
            phone: '0123 45678 90',
            email: 'meredith@email.com'
      },
    };
  },
  methods: {
    toggleDetails() {
      this.detailsVisible = !this.detailsVisible;
    },
  },
};
</script>