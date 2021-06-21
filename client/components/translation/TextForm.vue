<template>
  <section
    class="flex-1 flex flex-col pr-2.5"
  >
    <label
      class="text-2xl"
    >
      {{ caption }}
    </label>
    <textarea
      @change="onChange"
      :value="value"
      class="h-screen border-2"
    ></textarea>
  </section>
</template>

<script>
export default {
  name: "TextForm",
  props: {
    caption: {
      type: String,
      required: true
    },
    value: {
      type: String,
      default: '',
    }
  },
  methods: {
    onChange: function (event) {
      this.$emit('input', event.target.value)
    },
  }
}
</script>
