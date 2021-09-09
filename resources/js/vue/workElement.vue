<template>
    <div class="work">
        <span :class="[work.completed ? 'completed' : '', 'workText']"> {{ work.name }} </span>
        <span :class="[work.completed ? 'completed' : '', 'workText']"> {{ work.start_working | moment("DD/MM/YYYY HH:mm:ss") }} </span>
        <span :class="[work.completed ? 'completed' : '', 'workText']"> {{ work.end_working | moment("DD/MM/YYYY HH:mm:ss") }} </span>
        <span v-if="work.start_working && !work.end_working" id="processing">W&nbsp;trakcie...</span>
        <span v-if="!work.start_working && !work.end_working" id="processing">Nie&nbsp;rozpoczęte.</span>
        <button @click="startWork()" class="btn btn-success" :disabled="work.start_working ? true : false">Rozpocznij</button>
        <button @click="stopWork()" class="btn btn-warning" :disabled="work.completed || !work.start_working ? true : false">Zakończ</button>
        <button @click="removeWork()" class="btn btn-danger">Usuń</button>
    </div>
</template>

<script>
export default {
    props: ['work'],
    methods: {
        startWork() {
            axios.put('/work/' + this.work.id + '/start', {
                work: this.work
            })
            .then(response => {
                if(response.status == 200) {
                    this.$emit('workchanged');
                }
            })
            .catch(error => {
                console.log(error);
            })
        },
        removeWork() {
            axios.delete('/work/' + this.work.id)
            .then(response => {
                if(response.status == 200) {
                    this.$emit('workchanged');
                }
            })
            .catch(error => {
                console.log(error);
            })
        },
        stopWork() {
            this.work.completed = !this.work.completed;
            axios.put('/work/' + this.work.id + '/stop', {
                work: this.work
            })
            .then(response => {
                if(response.status == 200) {
                    this.$emit('workchanged');
                }
            })
            .catch(error => {
                console.log(error);
            })
        },
    }
}
</script>

<style scoped>

.completed {
    color: #999999;
}

.workText {
    width: 100%;
    margin-left: 20px;
}
.work {
    display: flex;
    justify-content: center;
    align-items: center;
}
#processing {
    margin-right: 5px;
}


</style>