## What is the Vue CLI?

### Why we need a development server

- Currently we're seeing `index.html` in the browser by viewing the file protocol instead of the HTTPS protocol
- Problems with this...
    - Some modern JS features don't work in the file protocol
    - The final app will be served via HTTPS, not the file protocol
- A development web server is what we need here!

### Why we want a better developer experience

- Current dev experience
    - Reload the page to see code changes (annoying, loses the current state of the web app)
    - Vue autocompletion and linting is limited since we're writing Vue in a JS file and not a Vue file.
    - We work with just one file or  we need to handle multiple files with multiple `<script src="">` imports
- Better dev experience
    - Saved changes are auto-detected and auto-updated
    - Better autocompletion and hints in IDE
    - Be able to split code into multiple files and export/import with ES modules

## Why do we need it?

### Installation

- Update/install node.js (dependency)
- Install with npm

### Vue Project Creation

- `vue create APPNAME`

### Inspecting the Created Project

- The `node_modules` dir houses project dependencies. Leave it alone!
- The `public` folder holds the final html file that will be served.
- The `src` folder contains the code we will be writing!

### Inspecting the Vue (.vue) Files

- The `main.js` imports our app from Vue
- The `App.vue` lets us split up various aspects of the Vue app
- Using a build workflow
    1. Our code uses next-gen and Vue-specific syntax and features (which wouldn't work in the browser)
    2. The Build Step transforms our code to standard JS
    3. The development or real server hosts and runs a regular JS-based app
- Combines components to create the UI

## How does the Vue CLI work?

### Creating a Basic Vue App

- Import default export in `main.js`

    ```jsx
    import { createApp } from 'vue';

    import App from './App.vue';

    createApp(App).mount('#app');
    ```

- Export default in `App.vue`

    ```jsx
    <script>
    export default {
      data() {
        return {
          friends: [
            {
              id: 'meredith',
              name: 'Meredith Bakke',
              phone: '0123 45678 90',
              email: 'meredith@email.com'
            },
            {
              id: 'christian',
              name: 'Christian Gonzalez',
              phone: '0987 7654 321',
              email: 'christian@email.com'
            },
          ]
        };
      },
    };
    </script>
    ```

- Add a template to display the app

    ```jsx
    <template>
      <section>
        <h2>My Friends</h2>
        <ul>
          <li></li>
        </ul>
      </section>
    </template>
    ```

### Adding a Component

- Create `src/components` folder
- Create `FriendContact.vue` within the `components` dir
- Code for `FriendContact.vue`

    ```jsx
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
    ```

- Register the component in `main.js`

    ```jsx
    import { createApp } from 'vue';

    import App from './App.vue';
    import FriendContact from './components/FriendContact.vue'

    const app = createApp(App)

    app.component('friend-contact', FriendContact);

    app.mount('#app');
    ```

- Update `app.vue` to include the new component

    ```jsx
    <template>
      <section>
        <h2>My Friends</h2>
        <ul>
          <li>
            <friend-contact></friend-contact>
            <friend-contact></friend-contact>
          </li>
        </ul>
      </section>
    </template>
    ```

### Adding Styling

- Add the `<style>` tag to `App.vue`

    ```jsx
    <style>
      * {
        box-sizing: border-box;
      }

      html {
        font-family: 'Jost', sans-serif;
      }

      body {
        margin: 0;
      }

      header {
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
        margin: 3rem auto;
        border-radius: 10px;
        padding: 1rem;
        background-color: #58004d;
        color: white;
        text-align: center;
        width: 90%;
        max-width: 40rem;
      }

      #app ul {
        margin: 0;
        padding: 0;
        list-style: none;
      }

      #app li {
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
        margin: 1rem auto;
        border-radius: 10px;
        padding: 1rem;
        text-align: center;
        width: 90%;
        max-width: 40rem;
      }

      #app h2 {
        font-size: 2rem;
        border-bottom: 4px solid #ccc;
        color: #58004d;
        margin: 0 0 1rem 0;
      }

      #app button {
        font: inherit;
        cursor: pointer;
        border: 1px solid #ff0077;
        background-color: #ff0077;
        color: white;
        padding: 0.05rem 1rem;
        box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.26);
      }

      #app button:hover,
      #app button:active {
        background-color: #ec3169;
        border-color: #ec3169;
        box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.26);
      }
    </style>
    ```