<template>
    <div class="workTime">
        <div class="heading">
            <h2 id="title">System rejestracji czasu pracy</h2>
                <work-add v-on:reloadlist="getList()" />
        </div>
            <work-list
            :works="works" 
            v-on:reloadlist="getList()" />
    </div>
</template>

<script>
import WorkAdd from './workAdd.vue'
import WorkList from './workList.vue'

export default {
    components: {
        WorkList,
        WorkAdd
    },
    data: function() {
        return {
            works: []
        }
    },
    methods: {
        getList() {
            axios.get('/works')
            .then(response => {
                this.works = response.data
            })
            .catch(error => {
                console.log(error);
            })
        }
    },
    created() {
        this.getList();
    }
    
}
</script>

<style scoped>
.workTime {
    width: auto;
    margin: 5px;
}

.heading {
    background: #e6e6e6;
    padding: 10px;

}

#title {
    text-align: center;
}
</style>