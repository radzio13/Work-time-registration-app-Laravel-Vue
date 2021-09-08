<template>
    <div>
        <div class="work2">
        <h4 class="workText">Nazwa</h4>
        <h4 class="workText">Data rozpoczęcia</h4>
        <h4 class="workText">Data zakończenia</h4>
        </div>
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

.work2 {
    background: #e6e6e6;
    display: flex;
    justify-content: center;
    align-items: center;
}

.workText {
    width: 100%;
    margin-left: 20px;
}
</style>