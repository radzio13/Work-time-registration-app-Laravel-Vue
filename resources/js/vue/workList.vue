<template>
    <div>
        <div v-for="(work, index) in works" :key="index" >
            <work-element :work="work" class="work" v-on:itemchanged="$emit('reloadlist')" />
        </div>
    </div>
</template>

<script>
import WorkElement from './workElement.vue'
export default {
    props: ['works'],
    components: {
        WorkElement
    }
}

</script>

<style scoped>

.work {
    background: #e6e6e6;
    padding: 5px;
    margin-top: 5px;
}
</style>