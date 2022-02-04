import { mount } from '@vue/test-utils';
import RandomNumber from '../../resources/js/components/RandomNumber.vue';

describe('RandomNumber', ()=>{
    test('If the button is not clicked the value should be 0.', ()=>{
        let wrapper = mount(RandomNumber);
        expect(wrapper.find('span').text()).toBe('0');
    });

    test('If the button is clicked the value should be between  1 and 10.', async ()=>{
        let wrapper = mount(RandomNumber);
        await wrapper.find('button').trigger('click');
        let val = parseInt(wrapper.find('span').text());
        expect(val).toBeGreaterThanOrEqual(1);
        expect(val).toBeLessThanOrEqual(10);
    });

    test('If the button is clicked with min & max props of 200 & 300, the value should be between 200 and 300.', async ()=>{
        let wrapper = mount(RandomNumber, {
            propsData: {
                min: 200,
                max: 300,
            }
        });
        wrapper.find('button').trigger('click');
        await wrapper.vm.$nextTick(); // await the click to change data
        let val = parseInt(wrapper.find('span').text());
        expect(val).toBeGreaterThanOrEqual(200);
        expect(val).toBeLessThanOrEqual(300);
     });
});